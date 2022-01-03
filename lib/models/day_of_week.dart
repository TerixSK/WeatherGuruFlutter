import 'package:flutter/material.dart';

class DayOfWeek extends ChangeNotifier {
  int _currentDay = 0;

  int get currentDay => _currentDay;

  set currentDay(int newValue) {
    _currentDay = newValue;
    notifyListeners();
  }
}
