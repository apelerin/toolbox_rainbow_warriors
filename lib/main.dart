import 'package:flutter/material.dart';
import 'package:toolbox/home_page.dart';
import 'package:toolbox/test_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        TestPage.tag: (context) => TestPage()
        //fill with routes for utilitary
      },
      debugShowCheckedModeBanner: false,
      title: 'Coding ProjectFlutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
