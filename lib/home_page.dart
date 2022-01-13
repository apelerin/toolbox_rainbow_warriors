import 'package:flutter/material.dart';
import 'package:toolbox/burger_menu.dart';
import 'home_page_style.dart';
import 'globals.dart';

class HomePage extends StatefulWidget {
  static const String tag = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            BurgerMenu()
          ],
        ),
        body: HomePageStyle.returnHomepageStyle(context)
    );
  }
}
