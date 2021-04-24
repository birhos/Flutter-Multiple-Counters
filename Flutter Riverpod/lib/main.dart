import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'stateNotifier/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
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
      title: "Flutter Riverpod Counter Example",
      home: Consumer(
        builder: (BuildContext context, watch, Widget? child) {
          // final state = context.read(counterProvider);
          final count = watch(counterProvider);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Flutter Riverpod Counter Example",
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
                    count.toString(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white.withOpacity(0.85),
                        ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read(counterProvider.notifier).increment();
              },
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
