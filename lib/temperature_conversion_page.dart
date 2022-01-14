import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:toolbox/widgets/converter.dart';

class TemperatureConversionPage extends StatefulWidget {
  static const String tag = "temperature_conversion_page";

  @override
  _TemperatureConversionPageState createState() =>
      _TemperatureConversionPageState();
}

class _TemperatureConversionPageState extends State<TemperatureConversionPage> {
  static List<Unit> units = [
    Unit("°C", 0),
    Unit("K", 0),
    Unit("°F", 0),
  ];

  var converterDic = {
    "K": [kelvinToCelsius, celsiusToKelvin],
    "°F": [fahrenheitToCelsius, celsiusToFahrenheit],
  };
  final controllerInput1 = TextEditingController();
  final controllerInput2 = TextEditingController();
  Unit selectedUnit1 = units.firstWhere((element) => element.shortName == "°C");
  Unit selectedUnit2 = units.firstWhere((element) => element.shortName == "°F");

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
    if (unitModified.shortName == "°C" && unitToConvertTo.shortName == "°C") {
      convertedInput = modifiedInput.text;
    } else if (unitModified.shortName == "°C") {
      convertedInput =
          converterDic[unitToConvertTo.shortName]![1](modifiedInput.text);
    } else if (unitToConvertTo.shortName == "°C") {
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
      appBar: AppBar(),
      body: Center(
        child: converterForm(units, selectUnit1, selectUnit2, controllerInput1,
            controllerInput2, selectedUnit1, selectedUnit2, convert,
            allowDecimal: true),
      ),
    );
  }
}

String celsiusToKelvin(String celsius) {
  return (double.parse(celsius) + 273.15).toString();
}

String celsiusToFahrenheit(String celsius) {
  return (int.parse(celsius) * 1.8 + 32).toString();
}

String kelvinToCelsius(String kelvin) {
  return (int.parse(kelvin) - 273.15).toString();
}

String fahrenheitToCelsius(String fah) {
  return ((int.parse(fah) - 32) / 1.8).toString();
}
