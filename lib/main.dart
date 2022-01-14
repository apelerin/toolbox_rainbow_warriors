import 'package:flutter/material.dart';
import 'package:toolbox/distance_conversion_page.dart';
import 'package:toolbox/home_page.dart';
import 'package:toolbox/numeric_conversion_page.dart';
import 'package:toolbox/promotion_page.dart';
import 'package:toolbox/temperature_conversion_page.dart';
import 'package:toolbox/test_page.dart';
import 'area_conversion_page.dart';
import 'get_file_size.dart';
import 'roman_nbrs_page.dart';
import 'home_page.dart';
import 'burger_menu.dart';
import 'temps_depuis_naissance.dart';
import 'temps_depuis_deux_dates.dart';

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
        TestPage.tag: (context) => TestPage(),
        GetFileSize.tag: (context) => GetFileSize(),
        TempsDepuisNaissance.tag: (context) => TempsDepuisNaissance(),
        TempsDepuisDeuxDates.tag: (context) => TempsDepuisDeuxDates(),
        PromotionPage.tag: (context) => PromotionPage(),
        DistanceConversionPage.tag: (context) => DistanceConversionPage(),
        AreaConversionPage.tag: (context) => AreaConversionPage(),
        NumericConversionPage.tag: (context) => NumericConversionPage(),
        TemperatureConversionPage.tag: (context) => TemperatureConversionPage(),
        RomanNbrs.tag: (context) => RomanNbrs(),
        HomePage.tag: (context) => HomePage()
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
