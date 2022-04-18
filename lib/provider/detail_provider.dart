import 'package:flutter/cupertino.dart';

import '../data/api/api_service.dart';
import '../data/model/respone_model.dart';

enum RestaurantState { loading, noData, hasData, error }

class DetailProvider extends ChangeNotifier {
  final ApiService detailApiService;
  final String id;

  DetailProvider({@required this.detailApiService, @required this.id}) {
    fecthDetailRestaurant(id);
  }

  RestaurantResponse _detailResto;
  RestaurantState _restaurantState;
  String _message = '';

  String get message => _message;
  RestaurantResponse get detailResto => _detailResto;
  RestaurantState get restaurantState => _restaurantState;

  Future<dynamic> fecthDetailRestaurant(String id) async {
    try {
      _restaurantState = RestaurantState.loading;
      notifyListeners();
      final detail = await detailApiService.restaurantDetailApi(id);
      if (detail.error) {
        _restaurantState = RestaurantState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _restaurantState = RestaurantState.hasData;
        notifyListeners();
        return _detailResto = detail;
      }
    } catch (e) {
      _restaurantState = RestaurantState.error;
      notifyListeners();
      return _message = 'Not connected to the internet...';
    }
  }
}
