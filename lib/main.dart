import 'package:flutter/material.dart';
import 'package:splash_screen/splash_screens/splash_screen2.dart';
import 'package:splash_screen/splash_screens/splash_screen3.dart';
import 'package:splash_screen/splash_screens/splash_screen_moving.dart';
import 'package:splash_screen/splash_screens/splash_screen_moving.dart';
import 'package:splash_screen/splash_screens/splash_screenwav.dart';
import 'splash_screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenMoving(),
    );
  }
}
