import 'dart:async';
import 'package:flutter/material.dart';

class ClockController extends ChangeNotifier {
  Timer? timer;
  DateTime currentTime = DateTime.now();

  final List<Map<String, dynamic>> cities = [
    {
      "name": "New York, USA",
      "timezoneOffset": -5,
      "weather": "Rainy",
      "temperature": "15°",
      "currency": "1 Dollar",
      "exchangeRate": "228 Rs"
    },
    {
      "name": "Istanbul, Turkey",
      "timezoneOffset": 3,
      "weather": "Rainy",
      "temperature": "15°",
      "currency": "1 Lira",
      "exchangeRate": "9.84 Rs"
    }
  ];

  ClockController() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime = DateTime.now();
      notifyListeners();
    });
  }

  DateTime get getcurrentTime => currentTime;

  DateTime getTimeForCity(int offset) {
    return currentTime.toUtc().add(Duration(hours: offset));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
