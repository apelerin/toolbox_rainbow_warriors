import 'package:flutter/material.dart';

class RomanNbrs extends StatefulWidget {
  static const String tag = "roman_nbrs_page";

  @override
  _RomanNbrs createState() => _RomanNbrs();
}

class _RomanNbrs extends State<RomanNbrs> {
  final ControllerTF1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Center(
        child: MyStatefulWidget(),
      )),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final controllerTF1 = TextEditingController();
  final controllerTF2 = TextEditingController();

  final decToRoman = {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I',
  };

  converter(TextEditingController controller) {
    if (controller == controllerTF1) {
      int decimalNbr = int.parse(controller.text);
      int nbrSymbol = 0;
      String romanNbr = '';

      decToRoman.forEach((key, value) {
        nbrSymbol = decimalNbr ~/ key;
        romanNbr += value * nbrSymbol;
        decimalNbr = decimalNbr % key;
      });
      controllerTF2.text = romanNbr;
    } else {
      String romanNbr = controllerTF2.text;
      int decimalNbr = 0;
      int actualNbr = 0;

      for (int i = 0, o = 0; i < romanNbr.length; i++, o = i) {
        decToRoman.forEach((key, value) {
          if (romanNbr[i] == value) {
            actualNbr = key;
            if (i + 1 < romanNbr.length) {
              decToRoman.forEach((key, value) {
                if (romanNbr[o + 1] == value) {
                  if (actualNbr < key) {
                    actualNbr = key - actualNbr;
                    i++;
                  }
                }
              });
            }
            decimalNbr += actualNbr;
          }
        });
      }
      controllerTF1.text = decimalNbr.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 500,
          child: Row(children: [
            Flexible(
                flex: 4,
                child: TextFormField(
                  controller: controllerTF1,
                  decoration: InputDecoration(labelText: 'Nombres décimaux'),
                  onChanged: (Text) {
                    converter(controllerTF1);
                  },
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 4,
                child: TextFormField(
                  controller: controllerTF2,
                  decoration: InputDecoration(labelText: 'Nombres romains'),
                  onChanged: (Text) {
                    converter(controllerTF2);
                  },
                )),
          ]),
        ),
      ],
    );
  }
}
