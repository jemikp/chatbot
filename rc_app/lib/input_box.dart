import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final orgController = TextEditingController();
  final destController = TextEditingController();
  final orgNode = FocusNode();
  final destNode = FocusNode();
  String currentAddress = 'cd';
  String orgAddress = '';
  String destAddress = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: orgController,
              decoration: InputDecoration(
                  focusColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Choose starting point',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.my_location_rounded),
                    onPressed: () {
                      orgController.text = currentAddress;
                      orgAddress = currentAddress;
                    },
                  )),
              focusNode: orgNode,
              onChanged: (String value) {
                setState(() {
                  orgAddress = value;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: destController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'Choose destination point',
              ),
              focusNode: destNode,
              onChanged: (String value) {
                setState(() {
                  destAddress = value;
                });
              },
            ),
          ),
        ],
      ),
    ));
  }
}
