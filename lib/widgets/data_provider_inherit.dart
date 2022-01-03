import 'package:weather_guru/models/weather_forecast_daily.dart';
import 'package:flutter/material.dart';

class DataProvider extends InheritedWidget {
  const DataProvider({Key? key, required this.model, required this.child})
      : super(key: key, child: child);

  // ignore: annotate_overrides, overridden_fields
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
