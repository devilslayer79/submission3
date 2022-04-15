import 'package:flutter/material.dart';
import 'package:restaurant_apps/ui/detail_page.dart';

import 'package:restaurant_apps/ui/restaurant_list_page.dart';
import 'package:restaurant_apps/ui/search_page.dart';
import 'package:restaurant_apps/ui/settings.dart';
import 'package:restaurant_apps/utils/notification_helper.dart';

import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key key, title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    RestaurantListPage(),
    SearchPage(),
    Settings(),
  ];

  final List<BottomNavigationBarItem> _bottomNavbarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        activeIcon: Icon(Icons.settings),
        label: 'Settings'),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FavoritePage();
              }));
            },
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavbarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  @override
  // agar dijalankan cuma sekali
  void initState() {
    super.initState();
    _notificationHelper
        .configurareSelectNotificationSubjec(RestaurantDetailPage.routeName);
  }

  @override
  // agar tidak terjadi kebocoran dari stream
  void dispose() {
    selectNotificationSubject.close();

    super.dispose();
  }
}
