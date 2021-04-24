import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final BehaviorSubject<int> counter = BehaviorSubject<int>.seeded(0);

  Stream<int> get stream => counter.stream;

  late int state;

  CounterBloc() {
    state = 0;
  }

  void increment() {
    state += 1;
    counter.sink.add(state);
  }

  void dispose() {
    counter.close();
  }
}
