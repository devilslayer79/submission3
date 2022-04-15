// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:restaurant_apps/data/api/api_service.dart';
import 'package:restaurant_apps/data/model/respone_model.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class ListProvider extends ChangeNotifier {
  final ApiService apiService;

  ListProvider({@required this.apiService}) {
    _fetchAllRestaurant();
  }

  Restaurant _restaurant;
  ResultState _state;
  String _message = '';

  String get message => _message;

  Restaurant get result => _restaurant;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.restaurantApi();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurant = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Not connected to the internet...';
    }
  }
}
