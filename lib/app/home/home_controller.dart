import 'dart:async';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  late Timer timer;
  DateTime currentTime = DateTime.now();
  String capitalCity = "Islamabad, PK";
  String timeZone = "+3 HRS | GMT";
  String weather = "Rainy";
  String temperature = "15";
  String currency = "Rs";
  String currencyConvert = "228";

  HomeController() {
    startClock();
  }

  DateTime get getCurrentTime => currentTime;

  void startClock() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime = DateTime.now();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
