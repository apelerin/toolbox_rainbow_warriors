import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var i = 0;
  bool get_file_size = false;
  bool promotion_page = false;
  bool distance_conversion_page = false;
  bool temps_depuis_naissance = false;
  bool temps_depuis_deux_dates = false;

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
              onHover: (hovering) {
                setState(() => get_file_size = hovering);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                padding: EdgeInsets.all(get_file_size ? 45 : 30),
                decoration: BoxDecoration(
                  color: get_file_size ? Colors.indigoAccent : Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Taille des fichiers',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('promotion_page');
              },
              onHover: (hovering) {
                setState(() => promotion_page = hovering);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                padding: EdgeInsets.all(promotion_page ? 45 : 30),
                decoration: BoxDecoration(
                  color: promotion_page ? Colors.indigoAccent : Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Calcul de promotion',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('distance_conversion_page');
              },
              onHover: (hovering) {
                setState(() => distance_conversion_page = hovering);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                padding: EdgeInsets.all(distance_conversion_page ? 45 : 30),
                decoration: BoxDecoration(
                  color: distance_conversion_page
                      ? Colors.indigoAccent
                      : Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Conversion des distances',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('temps_depuis_naissance');
              },
              onHover: (hovering) {
                setState(() => temps_depuis_naissance = hovering);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                padding: EdgeInsets.all(temps_depuis_naissance ? 45 : 30),
                decoration: BoxDecoration(
                  color: temps_depuis_naissance
                      ? Colors.indigoAccent
                      : Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Temps depuis la naissance',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('temps_depuis_deux_dates');
              },
              onHover: (hovering) {
                setState(() => temps_depuis_deux_dates = hovering);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                padding: EdgeInsets.all(temps_depuis_deux_dates ? 45 : 30),
                decoration: BoxDecoration(
                  color: temps_depuis_deux_dates
                      ? Colors.indigoAccent
                      : Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Temps depuis deux dates',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            // Add InkWell for each future utilitary tool + route key/value dictionnary
          ],
        ));
  }
}
