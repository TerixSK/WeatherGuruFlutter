import 'package:flutter/material.dart';

import 'screens/geolocation_screen.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WeatherGuru',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: isLogin ? const GeolocationScreen() : const StartScreen());
  }
}
