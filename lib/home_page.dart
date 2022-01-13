import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.count(
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
                Navigator.of(context).pushNamed('temps_depuis_naissance');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Temps depuis la naissance"),
                color: Colors.teal[100],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('temps_depuis_deux_dates');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Temps depuis la naissance"),
                color: Colors.teal[100],
              ),
            ),
            // Add InkWell for each future utilitary tool + route key/value dictionnary
          ],
        ));
  }
}
