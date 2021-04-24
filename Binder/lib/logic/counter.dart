import 'package:binder/binder.dart';

final counterRef = StateRef(0);

final counterLogicRef = LogicRef((scope) => CounterLogic(scope));

class CounterLogic with Logic {
  @override
  final Scope scope;

  CounterLogic(this.scope);

  void increment() {
    update(counterRef, (int x) => x + 1);
  }
}
