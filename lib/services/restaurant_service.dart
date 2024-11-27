import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RestaurantService extends ChangeNotifier {
  final String baseUrl = 'http://146.56.98.47:8000'; // 실제 서버 IP 주소로 변경
  final dio = Dio(BaseOptions(
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept',
    },
  ));

  Future<List<Map<String, dynamic>>> loadRestaurants() async {
    try {
      final response = await dio.get('$baseUrl/restaurants/');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      }
      return [];
    } catch (e) {
      debugPrint('Error loading restaurants: $e');
      return [];
    }
  }

  Future<void> addRestaurant(Map<String, dynamic> restaurant) async {
    try {
      final response = await dio.post(
        '$baseUrl/restaurants/',
        data: restaurant,
      );
      if (response.statusCode == 200) {
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error adding restaurant: $e');
      rethrow;
    }
  }
}
