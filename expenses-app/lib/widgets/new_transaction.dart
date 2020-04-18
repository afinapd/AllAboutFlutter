

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget{
  final Function onNewTransaction;
  NewTransaction(this.onNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction>{
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
     if (enteredTitle.isEmpty||enteredAmount<=0||_selectedDate==null){
       return;
     }
     widget.onNewTransaction(enteredTitle,enteredAmount,_selectedDate);
     Navigator.pop(context);
  }

  void _presentDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((pickedDate){
      if (pickedDate==null){
        return;
      } else{
        setState(() {
          _selectedDate=pickedDate;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_)=> submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType:TextInputType.number,
              controller: amountController,
              onSubmitted: (_)=> submitData(),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate==null
                    ? 'No date' : DateFormat.yMMMd().format(_selectedDate)),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed:(){ _presentDatePicker();},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
              child: FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: (){
                  submitData();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}