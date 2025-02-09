import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class SearchResultController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  String selectedCity = "Paris, France";
  String timeZone = "+3 HRS | GMT";
  String currency = "1 Euro";
  String currencyRate = "328 Rs";
  String weatherCondition = "Rainy";
  int temperature = 15;
  String highLowTemp = "22° / 16°";

  List<Map<String, String>> weeklyForecast = [
    {"day": "Mon", "icon": "assets/svg/clouds.svg", "temp": "22°/16°"},
    {"day": "Tue", "icon": "assets/svg/rainingClouds.svg", "temp": "19°/12°"},
    {"day": "Wed", "icon": "assets/svg/stormCloud.svg", "temp": "22°/16°"},
    {"day": "Thu", "icon": "assets/svg/sun.svg", "temp": "22°/16°"},
    {"day": "Fri", "icon": "assets/svg/sun.svg", "temp": "22°/16°"},
  ];

  late Timer timer;
  String currentTime = DateFormat.Hm().format(DateTime.now());

  SearchResultController() {
    _updateTime();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    currentTime = DateFormat.Hm().format(DateTime.now());
    notifyListeners(); // Notify listeners to update UI
  }

  void setCity(String city) {
    selectedCity = city;
    notifyListeners();
  }

  @override
  void dispose() {
    timer.cancel();
    searchController.dispose();
    super.dispose();
  }
}
