import 'package:flutter/material.dart';
import 'package:toolbox/distance_conversion_page.dart';
import 'package:toolbox/home_page.dart';
import 'package:toolbox/numeric_conversion_page.dart';
import 'package:toolbox/promotion_page.dart';
import 'package:toolbox/temperature_conversion_page.dart';
import 'package:toolbox/test_page.dart';
import 'area_conversion_page.dart';
import 'get_file_size.dart';

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
        PromotionPage.tag: (context) => PromotionPage(),
        DistanceConversionPage.tag: (context) => DistanceConversionPage(),
        AreaConversionPage.tag: (context) => AreaConversionPage(),
        NumericConversionPage.tag: (context) => NumericConversionPage(),
        TemperatureConversionPage.tag: (context) => TemperatureConversionPage(),
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
