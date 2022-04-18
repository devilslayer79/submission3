import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_apps/data/api/api_service.dart';
import 'package:restaurant_apps/data/model/detail_restaurant.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';
import 'package:restaurant_apps/provider/favorite_provider.dart';
import 'package:restaurant_apps/ui/detail_page.dart';
import 'package:restaurant_apps/ui/restaurant_detail_page.dart';
import 'package:restaurant_apps/widgets/detail_widget.dart';

import '../common/navigation.dart';

class CardRestaurant extends StatelessWidget {
  final RestaurantElement restaurants;

  // ignore: use_key_in_widget_constructors
  const CardRestaurant({this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, provider, _) {
        return FutureBuilder<bool>(
          future: provider.isRestaurant(restaurants.id),
          builder: (context, snapshot) {
            var isFavorite = snapshot.data ?? false;
            return Material(
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Hero(
                  tag: restaurants.id,
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/medium/${restaurants.pictureId}",
                    width: 100,
                  ),
                ),
                title: Text(restaurants.name),
                subtitle: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.place,
                          color: Colors.red,
                        ),
                        Text(restaurants.city),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                        isFavorite
                            ? IconButton(
                                icon: Icon(Icons.favorite),
                                color: Colors.red,
                                onPressed: () {
                                  provider.removeRestaurant(restaurants.id);
                                },
                              )
                            : IconButton(
                                icon: Icon(Icons.favorite_border),
                                color: Colors.red,
                                onPressed: () {
                                  provider.addRestaurant(restaurants);
                                },
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                        Text(restaurants.rating.toString()),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, DetailPage.routeName);
                },
              ),
            );
          },
        );
      },
    );
  }
}
