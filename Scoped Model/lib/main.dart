import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:example/listenable/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ScopedModel<Counter>(
      model: Counter(),
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
      title: 'Scoped Model Counter Example',
      home: ScopedModelDescendant<Counter>(
        builder: (BuildContext context, Widget? child, Counter counter) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Scoped Model Counter Example',
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white.withOpacity(0.60),
                        ),
                  ),
                  Text(
                    counter.state.toString(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white.withOpacity(0.85),
                        ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: counter.increment,
              tooltip: 'Increment',
              child: Icon(
                Icons.add,
              ),
            ),
          );
        },
      ),
    );
  }
}
