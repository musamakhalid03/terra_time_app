import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isnotificationSwitched = false;
  bool _hourTimeisSwitched = false;

  bool get isnotificationSwitched =>_isnotificationSwitched;

  bool get ishourTimeSwitched =>_hourTimeisSwitched;

  void notificationtoggleSwitch(bool? value) {
    _isnotificationSwitched = value ?? false;
    notifyListeners();
  }

  void hourTimetoggleSwitch(bool? value) {
    _hourTimeisSwitched = value ?? false;
    notifyListeners();
  }
}
