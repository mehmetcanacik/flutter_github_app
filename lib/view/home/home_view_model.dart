import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  late int getCounter;
  HomeViewModel() {
    setInit();
  }
  setInit() {
    getCounter = 0;
  }

  incrementCounter() {
    getCounter++;
    notifyListeners();
  }
}
