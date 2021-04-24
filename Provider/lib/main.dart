import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example/changeNotifiers/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Counter(),
        ),
      ],
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
    return Consumer<Counter>(
      builder: (BuildContext context, Counter counter, Widget? widget) {
//         final Counter counter = Provider.of<Counter>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          title: "Provider Counter Example",
          home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Provider Counter Example",
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
                    counter.state.toString(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white.withOpacity(0.85),
                        ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Provider.of<Counter>(context, listen: false).increment();
              },
              tooltip: 'Increment',
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        );
      },
    );
  }
}
