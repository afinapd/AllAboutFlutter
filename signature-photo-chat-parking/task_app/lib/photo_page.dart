import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  File imageFile;

  _openGallery(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }


  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('make a choice'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Galery'),
                onTap: (){_openGallery(context);},
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){_openCamera(context);},
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _decideImageView(){
    if(imageFile== null){
      return Text('no image selected');
    } else {
      return Image.file(imageFile, width: 400, height: 400,);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(
                onPressed: (){
                  _showChoiceDialog(context);
                },
                child: Text('select image'),
              )
            ],
          ),
        )
      ),
    );
  }
}