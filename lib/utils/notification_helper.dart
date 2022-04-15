import 'dart:convert';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_apps/common/navigation.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';
import 'package:rxdart/rxdart.dart';

import '../data/model/respone_model.dart';

final selectNotificationSubject = BehaviorSubject<String>();
final randomNumber = Random().nextInt(20);

//konsep singleton
class NotificationHelper {
  static NotificationHelper _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingAndroid =
        const AndroidInitializationSettings('app_icon');
    var initializationSettings =
        InitializationSettings(android: initializationSettingAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Restaurant restaurants) async {
    var _chId = "1";
    var _chName = "channel_01";
    var _chDescription = "Restaurant channel";

    var androidPlatformChannelSpacifics =
        AndroidNotificationDetails(_chId, _chName, //_chDescription,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            styleInformation: const DefaultStyleInformation(true, true));

    var platformChannelSpesifics = NotificationDetails(
      android: androidPlatformChannelSpacifics,
    );

    var titleNotification = "<b>Restaurant</b>";
    var titleRestaurant = restaurants.restaurants[randomNumber].name;

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      titleRestaurant,
      platformChannelSpesifics,
      payload: json.encode(restaurants.toJson()),
    );
  }

  void configurareSelectNotificationSubjec(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      var data = Restaurant.fromJson(json.decode(payload));
      var restaurant = data.restaurants[randomNumber];
      Navigation.intentWithData(route, restaurant);
    });
  }
}
