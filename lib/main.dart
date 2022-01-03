import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/screens/geolocation_screen.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: isLogin ? const GeolocationScreen() : const StartScreen());
  }
}
