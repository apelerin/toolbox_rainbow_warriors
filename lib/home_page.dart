import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text('toto')
        ],
      ),
      body:
      GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('test_page');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("Testing page BLANK"),
              color: Colors.teal[100],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('get_file_size');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("Testing page BLANK"),
              color: Colors.teal[100],
            ),
          ),
          // Add InkWell for each future utilitary tool + route key/value dictionnary
        ],
      )
    );
  }
}
