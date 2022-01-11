import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  static const String tag = "test_page";

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
