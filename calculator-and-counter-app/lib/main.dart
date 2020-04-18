import 'package:flutter/material.dart';
import 'result.dart';
import 'buttonNumber.dart';
import 'operation.dart';
import 'counter.dart';

void main() => runApp(new MyApp());
var txt = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey[800],
            leading: Icon(Icons.home),
            title: Text('Calculator')
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Result(txt),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonNumber(txt,'7'),
                  ButtonNumber(txt,'8'),
                  ButtonNumber(txt,'9'),
                  Operation(txt,'/'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonNumber(txt,'4'),
                  ButtonNumber(txt,'5'),
                  ButtonNumber(txt,'6'),
                  Operation(txt,'*'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonNumber(txt,'1'),
                  ButtonNumber(txt,'2'),
                  ButtonNumber(txt,'3'),
                  Operation(txt,'-'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Operation(txt,'C'),
                  ButtonNumber(txt,'0'),
                  Operation(txt,'='),
                  Operation(txt,'+'),
                ],
              ),
              Counter(),
            ],
          ),
        )
      ),
    );
  }
}