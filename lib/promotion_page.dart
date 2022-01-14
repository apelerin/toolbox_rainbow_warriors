import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PromotionPage extends StatefulWidget {
  static const String tag = "promotion_page";

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  String result = "0";
  String save = "0";
  final controllerPrice = TextEditingController();
  final controllerPromotion = TextEditingController();

  void computeReduction() {
    try {
      if (controllerPromotion.text != '' && controllerPrice.text != '') {
        setState(() {
          result = (double.parse(controllerPrice.text) -
                  (double.parse(controllerPrice.text) /
                      100 *
                      double.parse(controllerPromotion.text)))
              .toString();
          save = (double.parse(controllerPrice.text) - double.parse(result))
              .toString();
        });
      }
    } catch (e) {
      log(e.toString());
      setState(() {
        result = "ERREUR FORMAT";
        save = "ERREUR FORMAT";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: controllerPrice,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                onEditingComplete: computeReduction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Prix original',
                ),
              ),
            ),
            SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextField(
                    controller: controllerPromotion,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    onEditingComplete: computeReduction,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Reduction (%)',
                    ),
                  ),
                )),
            SizedBox(child: Text('Montant final: $result')),
            SizedBox(child: Text('Somme économisée: $save')),
          ],
        ),
      ),
    );
  }
}
