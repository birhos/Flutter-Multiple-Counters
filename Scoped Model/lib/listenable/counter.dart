import 'package:scoped_model/scoped_model.dart';

class Counter extends Model {
  int state = 0;

  void increment() {
    state++;
    notifyListeners();
  }
}
