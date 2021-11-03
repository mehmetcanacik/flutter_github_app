import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  late int getCounter;
  HomeViewModel() {
    getCounter = 0;
    notifyListeners();
    // setInit();
  }
  setInit() {
    // getCounter = 0;
  }

  incrementCounter() {
    getCounter++;
    notifyListeners();
  }
}
