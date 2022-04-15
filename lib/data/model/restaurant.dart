/*
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

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<RestaurantElement>.from((json["restaurants"] as List)
            .map((x) => RestaurantElement.fromJson(x))
            .where((restaurants) =>
                restaurants.id != null &&
                restaurants.name != null &&
                restaurants.description != null &&
                restaurants.pictureId != null &&
                restaurants.city != null &&
                restaurants.rating != null)));
  }
  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson()))
      };
}

class RestaurantElement {
  RestaurantElement({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menu menus;

  factory RestaurantElement.fromJson(Map<String, dynamic> json) {
    return RestaurantElement(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      rating: json["rating"].toDouble(),
    );
  }

  factory RestaurantElement.detailFromJson(Map<String, dynamic> json) =>
      RestaurantElement(
          id: json["id"],
          name: json["name"],
          description: json["description"],
          pictureId: json["pictureId"],
          city: json["city"],
          rating: json["rating"].toDouble(),
          menus: Menu.fromJson(json["menus"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}

class RestaurantResponse {
  RestaurantResponse({this.error, this.message, this.restaurant});

  final bool error;
  final String message;
  final RestaurantElement restaurant;

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantResponse(
          error: json["error"],
          message: json["message"],
          restaurant: RestaurantElement.detailFromJson(json["restaurant"]));
}

class Menu {
  Menu({this.foods, this.drinks});

  List<Food> foods;
  List<Drink> drinks;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Food {
  Food({this.name});

  final String name;

  factory Food.fromJson(Map<String, dynamic> json) => Food(name: json["name"]);

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Drink {
  Drink({this.name});

  final String name;

  factory Drink.fromJson(Map<String, dynamic> json) =>
      Drink(name: json["name"]);

  Map<String, dynamic> toJson() => {
        "name": name,
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
*/

class RestaurantElement {
  RestaurantElement({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  factory RestaurantElement.fromJson(Map<String, dynamic> json) =>
      RestaurantElement(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        pictureId: json["pictureId"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
