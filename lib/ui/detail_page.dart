import 'package:flutter/material.dart';
import 'package:restaurant_apps/data/model/detail_restaurant.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final DetailRestaurant restaurants;

  // ignore: use_key_in_widget_constructors
  const RestaurantDetailPage({this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Detail'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurants.pictureId,
              child: Image.network(
                  'https://restaurant-api.dicoding.dev/images/large/${restaurants.pictureId}'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurants.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: Colors.red,
                      ),
                      Text(
                        restaurants.city,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Text(restaurants.rating.toString()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Column(
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    restaurants.description,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Center(
                    child: Text(
                      'Menu',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Makanan',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                  ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: restaurants.menus.foods.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              const CircleAvatar(
                                radius: 40,
                              ),
                              SizedBox.fromSize(
                                size: const Size(10, 10),
                              ),
                              Text(
                                restaurants.menus.foods[index].name,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                'Rp.20.000',
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Minuman',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                  ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: restaurants.menus.drinks.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              const CircleAvatar(
                                radius: 40,
                              ),
                              SizedBox.fromSize(
                                size: const Size(10, 10),
                              ),
                              Text(
                                restaurants.menus.drinks[index].name,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                'Rp.20.000',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
