import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/restaurant.dart';

class RestaurantService extends ChangeNotifier {
  final List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => _restaurants;

  Future<List<Map<String, dynamic>>> loadRestaurants() async {
    try {
      final String response =
          await rootBundle.loadString('lib/assets/restaurants_data.json');
      final data = await json.decode(response);
      return List<Map<String, dynamic>>.from(data['restaurants']);
    } catch (error) {
      debugPrint('Error loading restaurants: $error');
      return [];
    }
  }

  // 기존 메서드들 유지
  void addRestaurant(Restaurant restaurant) {
    _restaurants.add(restaurant);
    notifyListeners();
  }

  void updateRestaurant(Restaurant restaurant) {
    final index = _restaurants.indexWhere((r) => r.id == restaurant.id);
    if (index != -1) {
      _restaurants[index] = restaurant;
      notifyListeners();
    }
  }

  void deleteRestaurant(String id) {
    _restaurants.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  Restaurant? getRestaurantById(String id) {
    try {
      return _restaurants.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }
}
