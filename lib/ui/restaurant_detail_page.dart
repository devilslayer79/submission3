import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/detail_provider.dart';
import '../provider/restaurant_provider.dart';
import '../widgets/detail_widget.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(
      builder: (context, state, _) {
        if (state.restaurantState == RestaurantState.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (state.restaurantState == RestaurantState.hasData) {
          var resto = state.detailResto.restaurant;
          return DetailWidget(restaurants: resto);
        } else if (state.restaurantState == RestaurantState.noData) {
          return Center(child: Text(state.message));
        } else if (state.restaurantState == RestaurantState.error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
