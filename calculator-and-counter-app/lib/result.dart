import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final TextEditingController txt;
  Result(this.txt);

  @override
  Widget build(BuildContext context) {
    txt.text='0';
    return Container(
        margin: EdgeInsets.only(top: 10),
        width: 390,
        child: TextField(
          readOnly: true,
          controller: txt,
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
        ));

  }
}