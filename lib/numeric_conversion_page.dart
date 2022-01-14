import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:toolbox/widgets/converter.dart';

class NumericConversionPage extends StatefulWidget {
  static const String tag = "numeric_conversion_page";

  @override
  _NumericConversionPageState createState() => _NumericConversionPageState();
}

class _NumericConversionPageState extends State<NumericConversionPage> {
  static List<Unit> units = [
    Unit("BIN", 0),
    Unit("OCT", 0),
    Unit("DEC", 0),
    Unit("HEX", 0),
  ];

  var converterDic = {
    "BIN": [binToDec, decToBin],
    "OCT": [octToDec, decToOct],
    "HEX": [hexToDec, decToHex],
  };
  final controllerInput1 = TextEditingController();
  final controllerInput2 = TextEditingController();
  Unit selectedUnit1 =
      units.firstWhere((element) => element.shortName == "DEC");
  Unit selectedUnit2 =
      units.firstWhere((element) => element.shortName == "BIN");

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
            controllerInput1, controllerInput2, selectedUnit1, selectedUnit2);
      } else {
        subConvert(
            controllerInput2, controllerInput1, selectedUnit2, selectedUnit1);
      }
    });
  }

  void subConvert(
      TextEditingController modifiedInput,
      TextEditingController toModifyInput,
      Unit unitModified,
      Unit unitToConvertTo) {
    if (modifiedInput.text == '') {
      toModifyInput.text = '';
      return;
    }
    String convertedInput;
    if (unitModified.shortName == "DEC" && unitToConvertTo.shortName == "DEC") {
      convertedInput = modifiedInput.text;
    } else if (unitModified.shortName == "DEC") {
      convertedInput =
          converterDic[unitToConvertTo.shortName]![1](modifiedInput.text);
    } else if (unitToConvertTo.shortName == "DEC") {
      convertedInput =
          converterDic[unitModified.shortName]![0](modifiedInput.text);
    } else {
      var result1 =
          converterDic[unitModified.shortName]![0](modifiedInput.text);
      convertedInput = converterDic[unitToConvertTo.shortName]![1](result1);
    }
    toModifyInput.text = convertedInput;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Numeric conversion'), centerTitle: true),
      body: Center(
        child: converterForm(units, selectUnit1, selectUnit2, controllerInput1,
            controllerInput2, selectedUnit1, selectedUnit2, convert),
      ),
    );
  }
}

String hexToDec(String hex) {
  return int.parse(hex, radix: 16).toString();
}

String binToDec(String bin) {
  return int.parse(bin, radix: 2).toString();
}

String octToDec(String oct) {
  return int.parse(oct, radix: 8).toString();
}

String decToHex(String dec) {
  return int.parse(dec).toRadixString(16);
}

String decToBin(String dec) {
  return int.parse(dec).toRadixString(2);
}

String decToOct(String dec) {
  return int.parse(dec).toRadixString(8);
}
