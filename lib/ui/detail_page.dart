import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:provider/provider.dart';

import 'package:restaurant_apps/data/model/restaurant.dart';
import 'package:restaurant_apps/provider/restaurant_provider.dart';
import 'package:restaurant_apps/ui/restaurant_detail_page.dart';

import '../data/api/api_service.dart';
import '../provider/detail_provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final RestaurantElement restaurant;

  const DetailPage({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  height: 28.0,
                  left: 0.0,
                  right: 0.0,
                  child: connected
                      ? Visibility(
                          visible: true,
                          child: Container(),
                        )
                      : Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              "Loss Connection",
                            ),
                          ),
                        ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChangeNotifierProvider<DetailProvider>(
                      create: (_) => DetailProvider(
                          detailApiService: ApiService(), id: restaurant.id),
                      child: const RestaurantDetailPage(),
                    ),
                  ),
                ),
              ],
            );
          },
          child: Container(),
        ),
      ),
    );
  }
}
