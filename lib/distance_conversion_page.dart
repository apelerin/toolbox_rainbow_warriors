import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:toolbox/widgets/converter.dart';

class DistanceConversionPage extends StatefulWidget {
  static const String tag = "distance_conversion_page";

  @override
  _DistanceConversionPageState createState() => _DistanceConversionPageState();
}

class _DistanceConversionPageState extends State<DistanceConversionPage> {
  static List<Unit> units = [
    Unit("km", 1000000000000),
    Unit("dm", 10000000000),
    Unit("m", 1000000000),
    Unit("cm", 10000000),
    Unit("mm", 1000000),
    Unit("nm", 1),
    Unit("yd", 914400000),
    Unit("ft", 304800000),
    Unit("in", 25400000),
  ];

  final controllerInput1 = TextEditingController();
  final controllerInput2 = TextEditingController();
  Unit selectedUnit1 = units.firstWhere((element) => element.shortName == "m");
  Unit selectedUnit2 = units.firstWhere((element) => element.shortName == "m");

  void selectUnit1(unit) {
    setState(() {
      selectedUnit1 = unit;
      if (controllerInput1.text != '') {
        convert("2");
      }
    });
  }

  void selectUnit2(unit) {
    setState(() {
      selectedUnit2 = unit;
      if (controllerInput1.text != '') {
        convert("1");
      }
    });
  }

  void convert(String whichInput) {
    setState(() {
      if (whichInput == "1") {
        subConvert(
            selectedUnit1, selectedUnit2, controllerInput1, controllerInput2);
      } else {
        subConvert(
            selectedUnit2, selectedUnit1, controllerInput2, controllerInput1);
      }
    });
  }

  void subConvert(unitModified, unitToConvertTo, inputModified, inputToModify) {
    if (inputModified.text == '') {
      inputToModify.text = '';
      return;
    }
    try {
      inputToModify.text = (double.parse(inputModified.text) *
              unitModified.multiplierToSmallest /
              unitToConvertTo.multiplierToSmallest)
          .toString();
    } catch (e) {
      log(e.toString());
      inputToModify.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Distance conversion'), centerTitle: true),
      body: Center(
        child: converterForm(units, selectUnit1, selectUnit2, controllerInput1,
            controllerInput2, selectedUnit1, selectedUnit2, convert,
            allowDecimal: true),
      ),
    );
  }
}
