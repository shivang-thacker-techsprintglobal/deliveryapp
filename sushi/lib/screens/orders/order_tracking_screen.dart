import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/order_model.dart';
import '../../models/restaurant_model.dart';
import '../../services/directions_service.dart';
import '../../services/restaurant_service.dart';
import '../../widgets/app_colors.dart';
import '../../blocs/orders/orders_cubit.dart';

class OrderTrackingScreen extends StatefulWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  GoogleMapController? _mapController;
  RestaurantModel? _restaurant;
  BitmapDescriptor? _driverIcon, _shopIcon, _customerIcon;
  Set<Polyline> _routePolylines = {};
  String? _lastRouteKey;

  @override
  void initState() {
    super.initState();
    _loadRestaurantInfo();
    _loadCustomIcons();
  }

  Future<void> _updateRoadRoute(OrderModel order) async {
    if (order.driverLocation == null || order.deliveryLocation == null) {
      if (_routePolylines.isNotEmpty && mounted) {
        setState(() => _routePolylines = {});
      }
      return;
    }

    final origin = LatLng(
      order.driverLocation!.latitude,
      order.driverLocation!.longitude,
    );
    final destination = LatLng(
      order.deliveryLocation!.latitude,
      order.deliveryLocation!.longitude,
    );
    final key =
        '${origin.latitude.toStringAsFixed(3)},${origin.longitude.toStringAsFixed(3)}_'
        '${destination.latitude.toStringAsFixed(3)},${destination.longitude.toStringAsFixed(3)}';
    if (key == _lastRouteKey && _routePolylines.isNotEmpty) return;
    _lastRouteKey = key;

    final points = await DirectionsService.instance.getRoute(
      origin: origin,
      destination: destination,
    );
    if (!mounted) return;

    setState(() {
      _routePolylines = points.length < 2
          ? {}
          : {
              Polyline(
                polylineId: const PolylineId('road_route'),
                points: points,
                color: const Color(0xFFF4A73D),
                width: 5,
              ),
            };
    });

    if (points.length >= 2) {
      final bounds = _boundsFrom(points);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mapController?.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
      });
    }
  }

  LatLngBounds _boundsFrom(List<LatLng> points) {
    var minLat = points.first.latitude;
    var maxLat = points.first.latitude;
    var minLng = points.first.longitude;
    var maxLng = points.first.longitude;
    for (final p in points) {
      minLat = minLat < p.latitude ? minLat : p.latitude;
      maxLat = maxLat > p.latitude ? maxLat : p.latitude;
      minLng = minLng < p.longitude ? minLng : p.longitude;
      maxLng = maxLng > p.longitude ? maxLng : p.longitude;
    }
    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  Future<void> _loadCustomIcons() async {
    // Matching the exact logic and size from DriverHomeScreen
    _driverIcon = await _getMarkerIcon(Icons.delivery_dining, Colors.orange);
    _shopIcon = await _getMarkerIcon(Icons.restaurant, Colors.red);
    _customerIcon = await _getMarkerIcon(Icons.person_pin_circle, Colors.blue);
    if (mounted) setState(() {});
  }

  Future<BitmapDescriptor> _getMarkerIcon(IconData iconData, Color color) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    const double size = 60.0; // Reduced size from 120.0
    
    final Paint paint = Paint()..color = color;
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2, paint);
    
    final Paint borderPaint = Paint()..color = Colors.white..style = PaintingStyle.stroke..strokeWidth = 4;
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2, borderPaint);

    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: String.fromCharCode(iconData.codePoint),
      style: TextStyle(
        fontSize: size * 0.6,
        fontFamily: iconData.fontFamily,
        color: Colors.white,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset((size - textPainter.width) / 2, (size - textPainter.height) / 2));

    final image = await pictureRecorder.endRecording().toImage(size.toInt(), size.toInt());
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.bytes(data!.buffer.asUint8List());
  }

  void _loadRestaurantInfo() async {
    final restaurant = await RestaurantService.fetchPrimary();
    if (restaurant != null && mounted) {
      setState(() => _restaurant = restaurant);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Order', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFFF4A73D),
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').doc(widget.orderId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFF4A73D)));
          }
          
          final order = OrderModel.fromJson(snapshot.data!.data() as Map<String, dynamic>, snapshot.data!.id);

          // Fetch road route off the build method.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _updateRoadRoute(order);
          });

          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      order.deliveryLocation?.latitude ??
                          order.driverLocation?.latitude ??
                          0,
                      order.deliveryLocation?.longitude ??
                          order.driverLocation?.longitude ??
                          0,
                    ),
                    zoom: 14,
                  ),
                  onMapCreated: (c) => _mapController = c,
                  myLocationButtonEnabled: false,
                  markers: _buildMarkers(order),
                  polylines: _routePolylines,
                ),
              ),
              _buildStatusCard(order),
              if (order.status == OrderStatus.pending)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () => _showCancelDialog(context, order.id),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text('CANCEL ORDER', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Set<Marker> _buildMarkers(OrderModel order) {
    final markers = <Marker>{};

    // 1. Restaurant Marker
    if (_restaurant?.branches != null && _restaurant!.branches!.isNotEmpty) {
      final shopLoc = _restaurant!.branches![0].location;
      if (shopLoc != null) {
        markers.add(Marker(
          markerId: const MarkerId('shop'),
          position: LatLng(shopLoc.latitude, shopLoc.longitude),
          icon: _shopIcon ?? BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(title: 'Shop'),
        ));
      }
    }

    // 2. Customer Marker
    if (order.deliveryLocation != null) {
      markers.add(Marker(
        markerId: const MarkerId('customer'),
        position: LatLng(order.deliveryLocation!.latitude, order.deliveryLocation!.longitude),
        icon: _customerIcon ?? BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(title: 'You'),
      ));
    }

    // 3. Driver Marker
    if (order.driverLocation != null) {
      markers.add(Marker(
        markerId: const MarkerId('driver'),
        position: LatLng(order.driverLocation!.latitude, order.driverLocation!.longitude),
        icon: _driverIcon ?? BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(title: 'Driver'),
      ));
    }

    return markers;
  }

  Widget _buildStatusCard(OrderModel order) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.lightOrange.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(_getStatusIcon(order.status), color: AppColors.lightOrange, size: 30),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.status.name.toUpperCase().replaceAll('_', ' '), 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text('Order #${order.id.substring(0, 5)}', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: (order.status.index + 1) / (OrderStatus.delivered.index + 1),
            backgroundColor: Colors.grey.shade200,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
            valueColor: const AlwaysStoppedAnimation(AppColors.lightOrange),
          ),
          const SizedBox(height: 10),
          Text(_getStatusDescription(order.status), style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  IconData _getStatusIcon(OrderStatus status) {
    if (status.index <= OrderStatus.readyForPickup.index) return Icons.restaurant;
    if (status.index <= OrderStatus.arrivedAtCustomer.index) return Icons.delivery_dining;
    return Icons.check_circle;
  }

  String _getStatusDescription(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending: return "Waiting for restaurant to accept your order...";
      case OrderStatus.accepted: return "Restaurant has accepted your order!";
      case OrderStatus.preparing: return "Chef is preparing your delicious meal...";
      case OrderStatus.readyForPickup: return "Food is ready! Waiting for driver...";
      case OrderStatus.driverAssigned: return "Driver is on the way to the restaurant.";
      case OrderStatus.arrivedAtRestaurant: return "Driver has arrived at the restaurant.";
      case OrderStatus.outForDelivery: return "Driver has picked up your food and is coming to you!";
      case OrderStatus.arrivedAtCustomer: return "Driver is at your location!";
      case OrderStatus.delivered: return "Order delivered! Enjoy your meal.";
      default: return "Processing your order...";
    }
  }

  void _showCancelDialog(BuildContext context, String orderId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Order'),
        content: const Text('Are you sure you want to cancel this order?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('NO')),
          TextButton(
            onPressed: () {
              context.read<OrdersCubit>().cancelOrder(orderId);
              Navigator.pop(context);
            },
            child: const Text('YES, CANCEL', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
