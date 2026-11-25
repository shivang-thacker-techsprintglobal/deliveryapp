import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant_model.dart';

/// Loads the main restaurant from Firestore (not a hardcoded doc id).
class RestaurantService {
  static Future<RestaurantModel?> fetchPrimary() async {
    final snap = await FirebaseFirestore.instance
        .collection('restaurants')
        .limit(20)
        .get();

    if (snap.docs.isEmpty) return null;

    for (final doc in snap.docs) {
      final data = doc.data();
      if (data['isActive'] != false) {
        return RestaurantModel.fromJson(data);
      }
    }

    return RestaurantModel.fromJson(snap.docs.first.data());
  }
}
