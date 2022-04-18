import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_apps/data/model/detail_restaurant.dart';
import 'package:restaurant_apps/data/model/respone_model.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<Restaurant> restaurantApi() async {
    final response = await http.get(Uri.parse(_baseUrl + '/list'));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future<RestaurantResponse> restaurantDetailApi(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + '/detail/$id'));
    if (response.statusCode == 200) {
      return RestaurantResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future<SearchResto> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + "/search?q=" + query));
    if (response.statusCode == 200) {
      return SearchResto.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Search');
    }
  }
}
