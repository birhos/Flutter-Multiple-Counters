import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/blocs/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
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
  late CounterBloc sayacBloc;

  @override
  void initState() {
    sayacBloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Flutter Bloc Counter Example",
      home: BlocBuilder<CounterBloc, int>(
        bloc: sayacBloc,

        //
        builder: (BuildContext context, int count) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Flutter Bloc Counter Example",
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
                sayacBloc.add(CounterEvent.increment);
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
