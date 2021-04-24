import 'package:binder/binder.dart';
import 'package:flutter/material.dart';

import 'logic/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BinderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch(counterRef);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Binder Counter Example",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Binder Counter Example",
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
              Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white.withOpacity(0.85),
                    ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.use(counterLogicRef).increment();
          },
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
