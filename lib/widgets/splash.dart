import 'package:flutter/material.dart';
import 'package:restaurant_apps/ui/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Icon(
          Icons.restaurant_menu,
          size: 110,
          color: Color.fromARGB(255, 255, 255, 255),
          semanticLabel: 'Restaurant App',
        ),
        nextScreen: HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromARGB(255, 35, 33, 33),
        duration: 3000,
      ),
    );
  }
}
