import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String textText;
  Answer(this.selectHandler,this.textText);

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: double.infinity,
      width : 200,
      height:50,
      child: RaisedButton(
        color: Colors.blueGrey,
        child: Text(textText),
        onPressed: selectHandler,
      ),
    );
  }
}
