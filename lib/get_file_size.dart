import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';

class GetFileSize extends StatefulWidget {
  static const String tag = "get_file_size";

  @override
  _GetFileSize createState() => _GetFileSize();
}

class _GetFileSize extends State<GetFileSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Byte conversion'), centerTitle: true),
        body: Center(child: MyStatefulWidget()));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String valueDropDown1 = 'O';
  String valueDropDown2 = 'O';
  final controllerTF1 = TextEditingController();
  final controllerTF2 = TextEditingController();

  // Gère les entrées de l'utilisateur
  handleChangeTF(String Text, String firstValueDropDown,
      TextEditingController secondValueController, String secondValueDropDown) {
    // Si le textfield est vide, on met l'autre vide aussi et on quitte la fonction
    if (Text == '') {
      secondValueController.text = Text;
      exit(0);
    }
    // On récupère la valeur entrée par l'utilisateur et on la transforme en octets
    double valueInOctet = double.parse(Text);
    switch (firstValueDropDown) {
      case 'Ko':
        {
          valueInOctet = double.parse(Text) * 1000;
        }
        break;
      case 'Mo':
        {
          valueInOctet = double.parse(Text) * 1000000;
        }
        break;
      case 'Go':
        {
          valueInOctet = double.parse(Text) * 1000000000;
        }
        break;
      case 'To':
        {
          valueInOctet = double.parse(Text) * 1000000000000;
        }
        break;
    }
    converter(valueInOctet, secondValueController, secondValueDropDown);
  }

  // Convertit les octets en la valeur désirée
  converter(double valueInOctet, TextEditingController valueSecondTF,
      String secondUnit) {
    double convertedValue = 0;
    switch (secondUnit) {
      case 'O':
        {
          convertedValue = valueInOctet;
        }
        break;
      case 'Ko':
        {
          convertedValue = valueInOctet / 1000;
        }
        break;
      case 'Mo':
        {
          convertedValue = valueInOctet / 1000000;
        }
        break;
      case 'Go':
        {
          convertedValue = valueInOctet / 1000000000;
        }
        break;
      case 'To':
        {
          convertedValue = valueInOctet / 1000000000000;
        }
        break;
    }
    setState(() {
      // On modifie le champ de texte à la valeur convertie
      valueSecondTF.text = convertedValue.toString();
    });
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
                  decoration: InputDecoration(labelText: 'Enter value'),
                  onChanged: (Text) {
                    handleChangeTF(
                        Text, valueDropDown1, controllerTF2, valueDropDown2);
                  },
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 1,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration.collapsed(hintText: ''),
                value: valueDropDown1,
                icon: const Icon(Icons.arrow_downward),
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String? newValue) {
                  setState(() {
                    valueDropDown1 = newValue!;
                  });
                  handleChangeTF(controllerTF1.text, valueDropDown1,
                      controllerTF2, valueDropDown2);
                },
                items: <String>['O', 'Ko', 'Mo', 'Go', 'To']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 30,
        ),
        Icon(Icons.swap_vert),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 500,
          child: Row(children: [
            Flexible(
                flex: 4,
                child: TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: controllerTF2,
                  decoration: InputDecoration(labelText: 'Enter value'),
                  onChanged: (Text) {
                    handleChangeTF(
                        Text, valueDropDown2, controllerTF1, valueDropDown1);
                  },
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 1,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration.collapsed(hintText: ''),
                value: valueDropDown2,
                icon: const Icon(Icons.arrow_downward),
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String? newValue) {
                  setState(() {
                    valueDropDown2 = newValue!;
                  });
                  handleChangeTF(controllerTF2.text, valueDropDown2,
                      controllerTF1, valueDropDown1);
                },
                items: <String>['O', 'Ko', 'Mo', 'Go', 'To']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
