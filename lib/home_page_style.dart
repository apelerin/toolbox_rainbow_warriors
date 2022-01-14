import 'globals.dart';
import 'package:flutter/material.dart';

class HomePageStyle {
  static var dictBool;

  static returnHomepageStyle(BuildContext context, dictBool, changeBool) {
    if (Globals.burgerValue == 1) {
      return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: returnInkWells(context, dictBool, changeBool));
    } else if (Globals.burgerValue == 2) {
      return ListView(children: returnInkWells(context, dictBool, changeBool));
    } else if (Globals.burgerValue == 3) {
      List<Widget> cardList = [];
      returnInkWells(context, dictBool, changeBool).forEach((element) {
        cardList.add(Card(
          child: element,
        ));
      });
      return SingleChildScrollView(
        child: Column(
          children: cardList,
        ),
      );
    }
  }

  static List<Widget> returnInkWells(
      BuildContext context, dictBool, changeBool) {
    return <Widget>[
      inkWellAnimated("get_file_size", dictBool["get_file_size"],
          "Conversion taille des fichiers", context, changeBool),
      inkWellAnimated("promotion_page", dictBool["promotion_page"],
          "Calcul promotion", context, changeBool),
      inkWellAnimated("roman_nbrs_page", dictBool["roman_nbrs_page"],
          "Conversion chiffres romains", context, changeBool),
      inkWellAnimated(
          "distance_conversion_page",
          dictBool["distance_conversion_page"],
          "Conversion distances",
          context,
          changeBool),
      inkWellAnimated(
          "temperature_conversion_page",
          dictBool["temperature_conversion_page"],
          "Conversion temperature",
          context,
          changeBool),
      inkWellAnimated(
          "numeric_conversion_page",
          dictBool["numeric_conversion_page"],
          "Conversion numériques",
          context,
          changeBool),
      inkWellAnimated("area_conversion_page", dictBool["area_conversion_page"],
          "Conversion aires", context, changeBool),
      inkWellAnimated(
          "temps_depuis_naissance",
          dictBool["temps_depuis_naissance"],
          "Calcul temps depuis la naissance",
          context,
          changeBool),
      inkWellAnimated(
          "temps_depuis_deux_dates",
          dictBool["temps_depuis_deux_dates"],
          "Calcul temps entre deux dates",
          context,
          changeBool),
    ];
  }
}

Widget inkWellAnimated(tag, boolPage, String title, context, changeBool) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed(tag);
    },
    onHover: (hovering) {
      changeBool(tag, hovering);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      padding: EdgeInsets.all(boolPage ? 45 : 30),
      decoration: BoxDecoration(
        color: boolPage ? Colors.indigoAccent : Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}
