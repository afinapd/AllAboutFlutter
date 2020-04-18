import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function onClickEvent;
  final String text;

  MainButton({this.text, this.onClickEvent});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onClickEvent,
      disabledTextColor: Colors.black45,
      textColor: Color.fromRGBO(208,52,47,1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
