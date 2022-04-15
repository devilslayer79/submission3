import 'package:restaurant_apps/data/model/detail_restaurant.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';

class Restaurant {
  Restaurant({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<RestaurantElement> restaurants;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<RestaurantElement>.from(
            json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class RestaurantResponse {
  RestaurantResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  final bool error;
  final String message;
  final DetailRestaurant restaurant;

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantResponse(
        error: json["error"],
        message: json["message"],
        restaurant: DetailRestaurant.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toJson(),
      };
}

class SearchResto {
  SearchResto({
    this.error,
    this.founded,
    this.restaurants,
  });

  final bool error;
  final int founded;
  final List<RestaurantElement> restaurants;

  factory SearchResto.fromJson(Map<String, dynamic> json) => SearchResto(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantElement>.from(
            json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
      );
}
