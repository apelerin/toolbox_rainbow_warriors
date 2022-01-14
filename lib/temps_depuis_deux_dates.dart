import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'dart:io';

class TempsDepuisDeuxDates extends StatefulWidget {
  static const String tag = "temps_depuis_deux_dates";

  @override
  _TempsDepuisDeuxDates createState() => _TempsDepuisDeuxDates();
}

class _TempsDepuisDeuxDates extends State<TempsDepuisDeuxDates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Temps depuis deux dates'), centerTitle: true),
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
  final valueDate2Text = TextEditingController();
  final getDifferenceText = TextEditingController();

  DateTime valueDate1 = DateTime.now();
  DateTime valueDate2 = DateTime.now();

  getDifference(DateTime valueDate1, DateTime valueDate2) {
    int totalDays = valueDate1.difference(valueDate2).inDays;
    totalDays = totalDays * -1;
    int years = totalDays ~/ 365;
    int months = (totalDays - years * 365) ~/ 30;
    int days = totalDays - years * 365 - months * 30;
    if (years > 0 || months > 0 || days > 0) {
      getDifferenceText.text = "erreur";
    }
    getDifferenceText.text =
        "Il y a $years années, $months mois, $days jours entre les deux dates";
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
                      valueDate1 = date;
                      valueDate1Text.text = date.toString();
                    }, currentTime: DateTime.now(), locale: LocaleType.fr);
                  },
                  child: const Text(
                    'Choisir une première date',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Flexible(
              child: TextField(controller: valueDate1Text),
            ),
          ]),
        ),
        Icon(Icons.swap_vert),
        SizedBox(
          width: 500,
          child: Row(children: [
            Flexible(
              child: TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        maxTime: DateTime.now(), onConfirm: (date) {
                      valueDate2 = date;
                      valueDate2Text.text = date.toString();
                    }, currentTime: DateTime.now(), locale: LocaleType.fr);
                  },
                  child: const Text(
                    'Choisir une deuxiemes date',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Flexible(
              child: TextField(controller: valueDate2Text),
            ),
          ]),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            getDifference(valueDate1, valueDate2);
          },
          child: Text('CONFIRMER'),
        ),
        TextField(controller: getDifferenceText),
      ],
    );
  }
}
