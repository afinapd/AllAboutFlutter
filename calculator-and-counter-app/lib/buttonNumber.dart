import 'package:flutter/material.dart';

class ButtonNumber extends StatelessWidget {
  final TextEditingController txt;
  final String inputUser;
  ButtonNumber(this.txt, this.inputUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: EdgeInsets.all(5),
      child: RaisedButton(
          child: Text(inputUser),
          onPressed:(){
          if (txt.text[0]=='0') txt.text='';
          txt.text = txt.text + inputUser;
    }));
  }
}