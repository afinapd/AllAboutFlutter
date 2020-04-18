import 'package:flutter/material.dart';

var num, op;
class Operation extends StatelessWidget {
  final TextEditingController txt;
  final String inputUser;
  Operation(this.txt, this.inputUser);

  void calculate(ops) {
    switch (ops) {
      case '+':
        txt.text = (num + int.parse(txt.text)).toString();
        break;
      case '-':
        txt.text = (num - int.parse(txt.text)).toString();
        break;
      case '*':
        txt.text = (num * int.parse(txt.text)).toString();
        break;
      case '/':
        txt.text = (num / int.parse(txt.text)).toString();
        break;
    }
  }

    @override
    Widget build(BuildContext context) {
      return Container(
          width: 90,
          margin: EdgeInsets.all(5),
          child: RaisedButton(
              child: Text(inputUser),
              onPressed: () {
                switch (inputUser) {
                  case '+':
                    op = '+';
                    num = int.parse(txt.text);
                    txt.text = '0';
                    break;
                  case '-':
                    op = '-';
                    num = int.parse(txt.text);
                    txt.text = '0';
                    break;
                  case '*':
                    op = '*';
                    num = int.parse(txt.text);
                    txt.text = '0';
                    break;
                  case '/':
                    op = '/';
                    num = int.parse(txt.text);
                    txt.text = '0';
                    break;
                  case 'C':
                    op = '';
                    num = int.parse(txt.text);
                    txt.text = '0';
                    break;
                  case'=':
                    calculate(op);
                    break;
                }
              }));
    }
  }