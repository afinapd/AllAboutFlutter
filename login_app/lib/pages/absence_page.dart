import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_app/models/absence_presence.dart';
import 'package:login_app/services/http_service.dart';

class AbsencePage extends StatefulWidget {
  @override
  _AbsencePageState createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  final _formKey = GlobalKey<FormState>();
  var _data = AbsencePresence();
  var _isLoading = false;

  submitForm() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });

      _formKey.currentState.save();
      try {
        await HttpService().addAbsence(_data);
        Navigator.of(context).pop();
      } catch (error) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('something went wrong'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      } finally {
        setState(() {
          _isLoading=false;
        });
      }
    }
  }

  String _validateEmpty(String value){
    if(value.length==0){
      return 'Please input the information';
    }
    return null;
  }

//  DateTime _selectedDate;
//  void _presentDatePicker(){
//    showDatePicker(
//        context: context,
//        initialDate: DateTime.now(),
//        firstDate: DateTime(2020),
//        lastDate: DateTime.now())
//        .then((pickedDate){
//      if (pickedDate==null){
//        return;
//      } else{
//        setState(() {
//          _selectedDate=pickedDate;
//        });
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: _isLoading ?
      Container(height: 200, child: Center(child: CircularProgressIndicator()))
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              validator: _validateEmpty,
              onSaved: (String value){
                _data.title = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Desription'),
              validator: _validateEmpty,
              onSaved: (String value){
                _data.description = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: RaisedButton(
              child: Text('save'),
              onPressed: submitForm,
            ),
          )
        ],
      ),
    );
  }
}
