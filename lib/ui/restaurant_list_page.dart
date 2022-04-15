import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_apps/provider/restaurant_provider.dart';
import 'package:restaurant_apps/widgets/card_restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key key}) : super(key: key);

  Widget _buildList() {
    return Consumer<ListProvider>(builder: (context, state, _) {
      // ignore: unrelated_type_equality_checks
      if (state.state == ResultState.Loading) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        ));
      } else {
        if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurants = state.result.restaurants[index];
              return CardRestaurant(restaurants: restaurants);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}
