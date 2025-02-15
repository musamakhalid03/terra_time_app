import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  bool isnotificationsSwitched = false;
  bool hourTimeisSwitched = false;

  bool get isnotificationSwitched => isnotificationsSwitched;

  bool get ishourTimeSwitched => hourTimeisSwitched;

  void notificationtoggleSwitch(bool? value) {
    isnotificationsSwitched = value ?? false;
    notifyListeners();
  }

  void hourTimetoggleSwitch(bool? value) {
    hourTimeisSwitched = value ?? false;
    notifyListeners();
  }
}
