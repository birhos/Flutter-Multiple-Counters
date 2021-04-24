import 'package:flutter/material.dart';

import 'package:example/blocs/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CounterBloc counterBloc;

  @override
  void initState() {
    counterBloc = CounterBloc();
    super.initState();
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "RxDart Counter Example",
      home: StreamBuilder<int>(
        stream: counterBloc.stream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "RxDart Counter Example",
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
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white.withOpacity(0.85),
                        ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                counterBloc.increment();
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
