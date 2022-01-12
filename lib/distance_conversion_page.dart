import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DistanceConversionPage extends StatefulWidget {
  static const String tag = "distance_conversion_page";

  @override
  _DistanceConversionPageState createState() => _DistanceConversionPageState();
}

class Unit {
  String shortName;
  double multiplierToNanoMeter;

  Unit(this.shortName, this.multiplierToNanoMeter);
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
        if (controllerInput1.text == '') {
          controllerInput2.text = '';
        }
        controllerInput2.text = (double.parse(controllerInput1.text) *
                selectedUnit1.multiplierToNanoMeter /
                selectedUnit2.multiplierToNanoMeter)
            .toString();
      } else {
        if (controllerInput2.text == '') {
          controllerInput1.text = '';
        }
        controllerInput1.text = (double.parse(controllerInput2.text) *
                selectedUnit2.multiplierToNanoMeter /
                selectedUnit1.multiplierToNanoMeter)
            .toString();
      }
    });
  }

  String compute(String input) {
    double multiplier = selectedUnit1.multiplierToNanoMeter *
        selectedUnit2.multiplierToNanoMeter;
    return (double.parse(input) * multiplier).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                dropDownUnits(units, selectUnit1, selectedUnit1),
                textInputNumberInSizeBox(controllerInput1, convert, "1"),
                textInputNumberInSizeBox(controllerInput2, convert, "2"),
                dropDownUnits(units, selectUnit2, selectedUnit2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget dropDownUnits(List<Unit> units, Function selectedFunction, selected) {
  return DropdownButton<Unit>(
    value: selected,
    items: units.map<DropdownMenuItem<Unit>>((Unit value) {
      return DropdownMenuItem<Unit>(
        value: value,
        child: Text(value.shortName),
      );
    }).toList(),
    onChanged: (Unit? newValue) {
      selectedFunction(newValue);
    },
  );
}

Widget textInputNumberInSizeBox(
    TextEditingController controller, Function convert, whichInput) {
  return SizedBox(
    width: 300,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      onChanged: (String? newValue) {
        convert(whichInput);
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Entrée',
      ),
    ),
  );
}
