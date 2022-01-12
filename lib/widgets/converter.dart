import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Unit {
  String shortName;
  double multiplierToSmallest;

  Unit(this.shortName, this.multiplierToSmallest);
}

Widget converterForm(
    units,
    Function selectUnit1,
    Function selectUnit2,
    controllerInput1,
    controllerInput2,
    selectedUnit1,
    selectedUnit2,
    Function convert) {
  return Column(
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
  );
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
