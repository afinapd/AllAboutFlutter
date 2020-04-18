import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_app/models/product.dart';
import 'package:project_akhir_app/services/http_service.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  var _data = Product();
  var _isLoading = false;

  submitForm() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      
    _formKey.currentState.save();
      try {
      await HttpService().addProduct(_data);
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


//    HttpService().addProduct(_data).then((_){
//      setState(() {
//        _isLoading = false;
//        Navigator.of(context).pop();
//      });
//    }).catchError((_){
//      showDialog(
//          context: context,
//          builder: (context){
//            return AlertDialog(
//              title: Text('Error'),
//              content: Text('something went wrong'),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text('ok'),
//                  onPressed: (){
//                    Navigator.of(context).pop();
//                  },
//                )
//              ],
//            );
//          }).then((_){
//            setState(() {
//              _isLoading=false;
//            });
//      });
//    });

//    HttpService().addProduct(_data);
//    Navigator.of(context).pop();

  String _validateEmpty(String value){
    if(value.length==0){
      return 'Please input the information';
    }
    return null;
  }
  
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
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              validator: _validateEmpty,
              onSaved: (String value){
                _data.price= double.parse(value);
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
