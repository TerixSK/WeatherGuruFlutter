import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/models/weather_forecast_daily.dart';

class DataProvider extends InheritedWidget {
  const DataProvider({Key? key, required this.model, required this.child})
      : super(key: key, child: child);

  final Widget child;
  final WeatherForecast model;

  @override
  bool updateShouldNotify(DataProvider oldWidget) {
    return model != oldWidget.model;
  }

  static DataProvider? read(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProvider>();
  }

  static DataProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProvider>();
  }
}
