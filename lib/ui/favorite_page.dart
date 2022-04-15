import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_apps/provider/favorite_provider.dart';

import '../widgets/card_restaurant.dart';

// ignore: must_be_immutable
class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite_page';

  FavoritePage({Key key}) : super(key: key);

  String favoriteTitle = 'Favorites';

  Widget _buildList(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, state, _) {
        if (state.state == RestaurantState.hasData) {
          return ListView.builder(
              itemBuilder: (context, index) {
                var favorite = state.favorite[index];
                return CardRestaurant(restaurants: favorite);
              },
              itemCount: state.favorite.length);
        } else {
          return Center(
            child: Text(state.message),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(favoriteTitle),
      ),
      body: _buildList(context),
    );
  }
}
