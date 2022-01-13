import 'globals.dart';
import 'package:flutter/material.dart';

class HomePageStyle {

  static returnHomepageStyle(BuildContext context) {
    if (Globals.burgerValue == 1) {
      return Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: <Widget>[
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
            // Add InkWell for each future utilitary tool + route key/value dictionnary
          ],
        ),
      );
    } else {
      return Text('toto');
    }
  }
}
