import 'package:flutter/material.dart';
import 'package:toolbox/widgets/converter.dart';

class AreaConversionPage extends StatefulWidget {
  static const String tag = "area_conversion_page";

  @override
  _AreaConversionPageState createState() => _AreaConversionPageState();
}

class _AreaConversionPageState extends State<AreaConversionPage> {
  static List<Unit> units = [
    Unit("km2", 10000000000),
    Unit("m2", 10000),
    Unit("cm2", 1),
    Unit("ha", 100000000),
    Unit("ac", 40470000000),
  ];

  final controllerInput1 = TextEditingController();
  final controllerInput2 = TextEditingController();
  Unit selectedUnit1 =
      units.firstWhere((element) => element.shortName == "cm2");
  Unit selectedUnit2 =
      units.firstWhere((element) => element.shortName == "cm2");

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
        if (controllerInput1.text == '') {
          controllerInput2.text = '';
        }
        controllerInput2.text = (double.parse(controllerInput1.text) *
                selectedUnit1.multiplierToSmallest /
                selectedUnit2.multiplierToSmallest)
            .toString();
      } else {
        if (controllerInput2.text == '') {
          controllerInput1.text = '';
        }
        controllerInput1.text = (double.parse(controllerInput2.text) *
                selectedUnit2.multiplierToSmallest /
                selectedUnit1.multiplierToSmallest)
            .toString();
      }
    });
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
