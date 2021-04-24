import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int state = 0;

  void increment() {
    state++;
    notifyListeners();
  }
}
