import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int val = 0;

  void tambah() {
    setState(() {
      val += 1;
    });
  }

  void kurang() {
    setState(() {
      if(val != 0){
        val -= 1;}
    });
  }

  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            flex:2,
            child:Container(
              decoration:BoxDecoration(
                  border:Border.all(color:Theme.of(context).primaryColor, width: 1)),
                  margin: EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 10,
              ),
              child:Text('$val',style: TextStyle(fontSize: 28)),
              padding: EdgeInsets.all(10),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('+'),
                  onPressed: () => tambah(),
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('-'),
                  onPressed: () => kurang(),
                ),
              ],
                ),
              )
            ],
          ),
    );
  }
}