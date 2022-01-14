import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(title: const Text('Roman numbers conversion'), centerTitle: true),
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

  // La liste des symboles romains associés à leur aleur
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

  // Convertit la valeur en symbole ou en décimal
  converter(TextEditingController controller) {
    // Si l'utilisateur a entré un nombre décimal
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
    }
    // Si l'utilisateur a entré des symbôles romains
    else {
      String romanNbr = controllerTF2.text;
      int decimalNbr = 0;
      int actualNbr = 0;

      // On parcourt la string de symbôles
      for (int i = 0, o = 0; i < romanNbr.length; i++, o = i) {
        // On regarde la correspondance du symbôle dans la liste de symbôles
        decToRoman.forEach((key, value) {
          // Quand on a trouvé une correspondance
          if (romanNbr[i] == value) {
            actualNbr = key;
            // On regarde si il y a un charactère qui suit
            if (i + 1 < romanNbr.length) {
              decToRoman.forEach((key, value) {
                if (romanNbr[o + 1] == value) {
                  // Si ce charactère est plus grand que celui actuel
                  if (actualNbr < key) {
                    // Sa valeur devient celle du prochain charactère - sa valeur actuelle
                    actualNbr = key - actualNbr;
                    i++;
                  }
                }
              });
            }
            // On ajoute la valeur trouvée au nombre décimal
            decimalNbr += actualNbr;
          }
        });
      }
      // On affiche le nombre décimal dans le TextField
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^M{0,3}(?:C[MD]|D?C{0,3})(?:X[CL]|L?X{0,3})(?:I[XV]|V?I{0,3})')),
                  ],
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
