import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CountController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Get Counter Example",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Get Counter Example",
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
              GetBuilder<CountController>(
                builder: (s) => Text(
                  s.count.toString(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white.withOpacity(0.85),
                      ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<CountController>().increment();
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
