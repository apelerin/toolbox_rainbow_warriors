import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetFileSize extends StatefulWidget {
  static const String tag = "get_file_size";

  @override
  _GetFileSize createState() => _GetFileSize();
}

class _GetFileSize extends State<GetFileSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Byte convertor'), centerTitle: true),
        body: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(labelText: 'Un label'),
                        )),
                        Expanded(child: MyStatefulWidget()),
                      ]),
                ),
              ),
              Flexible(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Icon(Icons.compare_arrows)),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: TextField(
                              decoration: InputDecoration(labelText: 'Un label'),
                            )),
                        Expanded(child: MyStatefulWidget()),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'O';

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['O', 'Ko', 'Mo', 'Go', 'To']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
