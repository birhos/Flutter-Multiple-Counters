enum CounterEvent { increment }

int counterReducer(int state, dynamic action) {
  if (action == CounterEvent.increment) {
    return state + 1;
  }

  return state;
}
