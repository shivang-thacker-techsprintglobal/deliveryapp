import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Road routes via Google Routes API (with legacy Directions fallback).
///
/// Free-quota protection:
/// - Caches routes so tiny GPS moves don't re-call the API
/// - On real quota/billing exhaustion, stops calling until the next day
/// - If the API is simply not enabled, skips for this app session only
class DirectionsService {
  DirectionsService._();
  static final DirectionsService instance = DirectionsService._();

  static const String _apiKey = 'AIzaSyBvc7de2dYkdFnQkjJ2_pmC4kxIcMVkiH4';
  static const String _quotaFlagKey = 'directions_quota_exhausted_date';

  bool _quotaExhaustedToday = false;
  bool _disabledThisSession = false;
  bool _loadedQuotaFlag = false;
  final Map<String, List<LatLng>> _cache = {};

  Future<void> _ensureQuotaFlagLoaded() async {
    if (_loadedQuotaFlag) return;
    _loadedQuotaFlag = true;
    final prefs = await SharedPreferences.getInstance();
    _quotaExhaustedToday = prefs.getString(_quotaFlagKey) == _todayKey();
  }

  String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  Future<void> _markQuotaExhaustedToday(String reason) async {
    _quotaExhaustedToday = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_quotaFlagKey, _todayKey());
    debugPrint('Directions stopped for today ($reason)');
  }

  void _disableSession(String reason) {
    _disabledThisSession = true;
    debugPrint('Directions disabled this session ($reason)');
  }

  bool get _shouldSkip => _quotaExhaustedToday || _disabledThisSession;

  String _cacheKey(LatLng origin, LatLng destination) {
    String r(double v) => v.toStringAsFixed(3); // ~110m
    return '${r(origin.latitude)},${r(origin.longitude)}_'
        '${r(destination.latitude)},${r(destination.longitude)}';
  }

  Future<List<LatLng>> getRoute({
    required LatLng origin,
    required LatLng destination,
  }) async {
    await _ensureQuotaFlagLoaded();
    if (_shouldSkip) return const [];

    final key = _cacheKey(origin, destination);
    final cached = _cache[key];
    if (cached != null) return cached;

    var points = await _fetchRoutesApi(origin, destination);
    if (points.isEmpty && !_shouldSkip) {
      points = await _fetchLegacyDirections(origin, destination);
    }
    if (points.isEmpty) return const [];

    _cache[key] = points;
    return points;
  }

  Future<List<LatLng>> _fetchRoutesApi(LatLng origin, LatLng destination) async {
    final uri =
        Uri.parse('https://routes.googleapis.com/directions/v2:computeRoutes');
    try {
      final response = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'X-Goog-Api-Key': _apiKey,
              'X-Goog-FieldMask':
                  'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
            },
            body: jsonEncode({
              'origin': {
                'location': {
                  'latLng': {
                    'latitude': origin.latitude,
                    'longitude': origin.longitude,
                  },
                },
              },
              'destination': {
                'location': {
                  'latLng': {
                    'latitude': destination.latitude,
                    'longitude': destination.longitude,
                  },
                },
              },
              'travelMode': 'DRIVE',
            }),
          )
          .timeout(const Duration(seconds: 12));

      final bodyLower = response.body.toLowerCase();

      if (response.statusCode == 429 ||
          bodyLower.contains('resource_exhausted') ||
          bodyLower.contains('quota') ||
          bodyLower.contains('rate limit')) {
        await _markQuotaExhaustedToday('Routes API rate/quota');
        return const [];
      }

      if (response.statusCode == 403 ||
          bodyLower.contains('permission denied') ||
          bodyLower.contains('access_denied') ||
          bodyLower.contains('billing')) {
        if (bodyLower.contains('billing') || bodyLower.contains('quota')) {
          await _markQuotaExhaustedToday('Routes API billing/quota');
        } else {
          // API not enabled yet — don't spam failed calls this session.
          _disableSession('Routes API not enabled / permission denied');
        }
        return const [];
      }

      if (response.statusCode != 200) {
        debugPrint('Routes API HTTP ${response.statusCode}');
        return const [];
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final routes = data['routes'] as List?;
      if (routes == null || routes.isEmpty) return const [];
      final encoded =
          routes.first['polyline']?['encodedPolyline']?.toString();
      if (encoded == null || encoded.isEmpty) return const [];
      return decodePolyline(encoded);
    } catch (e) {
      debugPrint('Routes API error: $e');
      return const [];
    }
  }

  Future<List<LatLng>> _fetchLegacyDirections(
    LatLng origin,
    LatLng destination,
  ) async {
    final uri = Uri.https('maps.googleapis.com', '/maps/api/directions/json', {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'mode': 'driving',
      'key': _apiKey,
    });

    try {
      final response =
          await http.get(uri).timeout(const Duration(seconds: 12));
      if (response.statusCode != 200) return const [];

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final status = data['status']?.toString() ?? '';
      final msg = (data['error_message'] ?? '').toString().toLowerCase();

      if (status == 'OVER_QUERY_LIMIT' || status == 'OVER_DAILY_LIMIT') {
        await _markQuotaExhaustedToday(status);
        return const [];
      }

      if (status == 'REQUEST_DENIED') {
        if (msg.contains('billing') || msg.contains('quota')) {
          await _markQuotaExhaustedToday('Directions billing/quota');
        } else {
          _disableSession('Directions not enabled: $msg');
        }
        return const [];
      }

      if (status != 'OK') return const [];

      final routes = data['routes'] as List?;
      if (routes == null || routes.isEmpty) return const [];
      final overview =
          routes.first['overview_polyline']?['points']?.toString();
      if (overview == null || overview.isEmpty) return const [];
      return decodePolyline(overview);
    } catch (e) {
      debugPrint('Legacy Directions error: $e');
      return const [];
    }
  }

  static List<LatLng> decodePolyline(String encoded) {
    final points = <LatLng>[];
    int index = 0;
    int lat = 0;
    int lng = 0;

    while (index < encoded.length) {
      int shift = 0;
      int result = 0;
      int b;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      final dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      final dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1e5, lng / 1e5));
    }
    return points;
  }
}
