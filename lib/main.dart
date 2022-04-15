import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_apps/common/navigation.dart';
import 'package:restaurant_apps/common/style.dart';
import 'package:restaurant_apps/data/api/api_service.dart';
import 'package:restaurant_apps/data/db/database_helper.dart';
import 'package:restaurant_apps/data/model/detail_restaurant.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';
import 'package:restaurant_apps/provider/favorite_provider.dart';
import 'package:restaurant_apps/provider/restaurant_provider.dart';
import 'package:restaurant_apps/provider/scheduling_provider.dart';
import 'package:restaurant_apps/provider/search_provider.dart';
import 'package:restaurant_apps/ui/detail_page.dart';
import 'package:restaurant_apps/ui/favorite_page.dart';

import 'package:restaurant_apps/ui/search_page.dart';
import 'package:restaurant_apps/utils/background_service.dart';
import 'package:restaurant_apps/utils/notification_helper.dart';
import 'package:restaurant_apps/widgets/splash.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();

  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListProvider>(
          create: (_) => ListProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (_) => SearchProvider(searchApiService: ApiService()),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider<SchedulingProvider>(
            create: (_) => SchedulingProvider()),
      ],
      child: MaterialApp(
          title: 'Restaurant App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: myTextTheme,
          ),
          navigatorKey: navigatorKey,
          initialRoute: Splash.routeName,
          routes: {
            Splash.routeName: (context) => const Splash(),
            RestaurantDetailPage.routeName: ((context) => RestaurantDetailPage(
                  restaurants: ModalRoute.of(context)?.settings?.arguments
                      as DetailRestaurant,
                )),
            SearchPage.routeName: (context) => SearchPage(),
            FavoritePage.routeName: (context) => FavoritePage(),
          }),
    );
  }
}
