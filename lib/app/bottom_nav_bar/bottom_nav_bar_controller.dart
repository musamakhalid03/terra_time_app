import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  int _bottomIndex = 0;

  int get bottomIndex => _bottomIndex;

  void updateIndex(int index) {
    _bottomIndex = index;
    notifyListeners();
  }
}
