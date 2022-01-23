import 'package:calculator/mainPages/calculator.dart';
import 'package:flutter/material.dart';
import 'dart:async';

StreamController<int> streamControllar = StreamController<int>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  StreamController<int> streamControllar = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonColor: Colors.grey[850],
        bottomAppBarColor: Colors.amber,
        cardColor: Colors.grey,
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400),
            headline2: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400),
            headline3: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w400)),
        primarySwatch: Colors.blue,
      ),
      home: CalCulatorPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
