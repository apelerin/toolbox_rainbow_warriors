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
  Map<String, bool> dictBoolPage = {
    "get_file_size": false,
    "promotion_page": false,
    "distance_conversion_page": false,
    "roman_nbrs_page": false,
    "temperature_conversion_page": false,
    "numeric_conversion_page": false,
    "area_conversion_page": false,
    "temps_depuis_naissance": false,
    "temps_depuis_deux_dates": false,
  };

  bool get_file_size = false;
  bool promotion_page = false;
  bool distance_conversion_page = false;
  bool roman_nbrs_page = false;
  bool temperature_conversion_page = false;
  bool numeric_conversion_page = false;
  bool area_conversion_page = false;
  bool temps_depuis_naissance = false;
  bool temps_depuis_deux_dates = false;

  void changeBool(boolPage, toggle) {
    setState(() {
      dictBoolPage[boolPage] = toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [BurgerMenu()],
        ),
        body: Center(
          child: HomePageStyle.returnHomepageStyle(
              context, dictBoolPage, changeBool),
        ));
  }
}
