import 'package:flutter/material.dart';
import 'package:restaurant_apps/data/db/database_helper.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';

enum RestaurantState { loading, noData, hasData, error }

class FavoriteProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  FavoriteProvider({this.databaseHelper}) {
    getAllRestaurant();
  }

  RestaurantState _state;
  RestaurantState get state => _state;

  String _message = '';
  String get message => _message;

  List<RestaurantElement> _favorite = [];
  List<RestaurantElement> get favorite => _favorite;

  void getAllRestaurant() async {
    _favorite = await databaseHelper.getAllRestaurant();
    if (_favorite.isNotEmpty) {
      _state = RestaurantState.hasData;
    } else {
      _state = RestaurantState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addRestaurant(RestaurantElement restaurant) async {
    try {
      await databaseHelper.insertRestaurant(restaurant);
      getAllRestaurant();
    } catch (e) {
      _state = RestaurantState.error;
      _message = 'Not connected to the internet...';
      notifyListeners();
    }
  }

  Future<bool> isRestaurant(String id) async {
    final favoritRestaurant = await databaseHelper.getRestaurantById(id);
    return favoritRestaurant.isNotEmpty;
  }

  void removeRestaurant(String id) async {
    try {
      await databaseHelper.removeRestaurant(id);
      getAllRestaurant();
    } catch (e) {
      _state = RestaurantState.error;
      _message = 'Not connected to the internet...';
      notifyListeners();
    }
  }
}
