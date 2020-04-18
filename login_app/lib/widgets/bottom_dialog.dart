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
            height: MediaQuery.of(context).size.height / 7,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Scaffold(body: message),
            )
          ),
      ],
    );

//      Column(
//      mainAxisSize: MainAxisSize.max,
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        Container(
//          height: height,
//          decoration: BoxDecoration(
//            color: Colors.white54
//          ),
//          child: Column(children: <Widget>[
//            ListTile(
//              leading: Icon(icon),
//              title: Column(
//                children: <Widget>[message],
//              ),
//              subtitle: subMessage,
//            )
//          ]),
//        )
//      ],
//    );
//    ;
  }
}
