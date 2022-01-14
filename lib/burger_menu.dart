import 'package:flutter/material.dart';
import 'globals.dart';

// Le widget du burger menu
class BurgerMenu extends StatefulWidget {
  static const String tag = "burger_menu";

  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

// Le burger menu
class _BurgerMenuState extends State<BurgerMenu> {
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        initialValue: Globals.burgerValue,
        onSelected: (int result) {
          Globals.burgerValue = result;
          Navigator.pop(context);
          Navigator.pushNamed(context, "home_page");
        },
        // Les options du menu button
        itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Grid"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("List"),
              ),
              PopupMenuItem(
                value: 3,
                child: Text("Card"),
              ),
            ]);
  }
}
