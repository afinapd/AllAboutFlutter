import 'package:flutter/material.dart';

class BottomDialog extends StatelessWidget {
  final Widget message;

  BottomDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
            child: Container(
              width: MediaQuery.of(context).size.width /2,
              height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Scaffold(body: message),
            )
        ),
      ],
    );
  }
}
