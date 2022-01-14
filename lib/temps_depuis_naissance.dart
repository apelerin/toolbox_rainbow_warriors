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
  final valueDate1Text = TextEditingController();
  final getDifferenceText = TextEditingController();
  getDifference(DateTime date, DateTime now) {
    int totalDays = now.difference(date).inDays;
    int months = totalDays ~/ 30;
    int days = totalDays;
    int hours = now.difference(date).inHours;
    if (hours > 0 || months > 0 || days > 0) {
      getDifferenceText.text = "erreur";
    }
    getDifferenceText.text =
        "Il y a $months mois, $days jours, $hours heures depuis mon anniversaire.";
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Column(
      children: [
        SizedBox(
          width: 500,
          child: Row(children: [
            Flexible(
              child: TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        maxTime: DateTime.now(), onConfirm: (date) {
                      getDifference(date, now);
                      valueDate1Text.text = date.toString();
                    }, currentTime: DateTime.now(), locale: LocaleType.fr);
                  },
                  child: const Text(
                    'Choisir une date',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Flexible(
              child: TextField(controller: valueDate1Text),
            ),
          ]),
        ),
        TextField(controller: getDifferenceText),
      ],
    );
  }
}
