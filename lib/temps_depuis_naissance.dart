import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'dart:io';

class TempsDepuisNaissance extends StatefulWidget {
  static const String tag = "temps_depuis_naissance";

  @override
  _TempsDepuisNaissance createState() => _TempsDepuisNaissance();
}

class _TempsDepuisNaissance extends State<TempsDepuisNaissance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Temps depuis naissance'), centerTitle: true),
        body: Center(child: MyStatefulWidget()));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  getDifference(DateTime date, DateTime now) {
    int totalDays = now.difference(date).inDays;
    int years = totalDays ~/ 365;
    int months = (totalDays - years * 365) ~/ 30;
    int days = totalDays - years * 365 - months * 30;
    print(
        "Il y a $years années, $months mois, $days jours entre les deux dates");
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Column(
      children: [
        SizedBox(
          width: 500,
          child: Row(children: [
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context, showTitleActions: true,
                      onConfirm: (date) {
                    getDifference(date, now);
                  }, currentTime: DateTime.now(), locale: LocaleType.fr);
                },
                child: const Text(
                  'Choisir une date',
                  style: TextStyle(color: Colors.blue),
                )),
          ]),
        ),
      ],
    );
  }
}
