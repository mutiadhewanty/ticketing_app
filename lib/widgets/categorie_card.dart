import 'package:flutter/material.dart';

class CategorieCard extends StatelessWidget {
  final String? text;

  CategorieCard({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                text!,
                style: TextStyle(fontSize: 15), textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
