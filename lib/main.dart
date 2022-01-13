import 'package:flutter/material.dart';
import 'package:toolbox/distance_conversion_page.dart';
import 'package:toolbox/home_page.dart';
import 'package:toolbox/promotion_page.dart';
import 'package:toolbox/test_page.dart';
import 'get_file_size.dart';
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
        //fill with routes for each utility
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
