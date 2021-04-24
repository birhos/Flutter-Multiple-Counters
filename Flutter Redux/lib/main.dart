import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

/// Reducers
import 'package:example/reducers/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final Store<int> counter = Store<int>(counterReducer, initialState: 0);

  runApp(
    StoreProvider<int>(
      store: counter,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Redux Counter Example",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Redux Counter Example",
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white.withOpacity(0.60),
                    ),
              ),
              StoreConnector<int, String>(
                converter: (Store store) => store.state.toString(),
                builder: (BuildContext context, String state) {
                  return Text(
                    state,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white.withOpacity(0.85),
                        ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: StoreConnector<int, Function>(
          converter: (Store store) {
            return () => store.dispatch(CounterEvent.increment);
          },
          builder: (BuildContext context, Function increment) {
            return FloatingActionButton(
              onPressed: increment as void Function()?,
              tooltip: 'Increment',
              child: Icon(
                Icons.add,
              ),
            );
          },
        ),
      ),
    );
  }
}
