import 'globals.dart';
import 'package:flutter/material.dart';

class HomePageStyle {
  static returnHomepageStyle(BuildContext context) {
    if (Globals.burgerValue == 1) {
      return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: returnInkWells(context));
    } else if (Globals.burgerValue == 2) {
      return ListView(children: returnInkWells(context));
    } else if (Globals.burgerValue == 3) {
      List<Widget> cardList = [];
      returnInkWells(context).forEach((element) {
        cardList.add(Card(
          child: element,
        ));
      });
      return Column(
        children: cardList,
      );
    }
  }

  static List<Widget> returnInkWells(BuildContext context) {
    return <Widget>[
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('get_file_size');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text("Taille des fichiers"),
          color: Colors.teal[100],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('promotion_page');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text("Calcul de promotion"),
          color: Colors.teal[100],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('distance_conversion_page');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text("Conversion des distances"),
          color: Colors.teal[100],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('roman_nbrs_page');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text("Conversion en chiffres romains"),
          color: Colors.teal[100],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('temperature_conversion_page');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text("Conversion de températures"),
          color: Colors.teal[100],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('numeric_conversion_page');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text("Conversion numérique"),
          color: Colors.teal[100],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('area_conversion_page');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text("Conversion des aires"),
          color: Colors.teal[100],
        ),
      ),
    ];
  }
}
