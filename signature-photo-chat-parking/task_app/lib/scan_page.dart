import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:task_app/main_button.dart';
import 'package:task_app/model_parking.dart';
import 'package:task_app/pop_dialog.dart';
import 'package:http/http.dart' as http;

class ScanPage extends StatefulWidget {
//  final String code;
//  ScanPage({this.code});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String id;
  String scannerResult;
  Parking parking;

  Future<Parking> getParking() async{
    final response = await http.get('http://192.168.43.243:4000/parkir/getLot?id=1');
    if (response.statusCode == 200) {
      return Parking.fromJSON(json.decode(response.body));
    } else {
      throw Exception('Failed to load barcode');
    }
//    await http.get('http://192.168.43.243:4000/parkir/getLot?id=$id')
//        .then((response){
//      if(jsonDecode(response.body)!=null){
//        setState(() {
//          parking=Parking.fromJSON(jsonDecode(response.body));
//        });
//      }
//    });
//    return parking;
  }
  Future<Parking> futureParking;

  @override
  void initState() {
    futureParking = getParking();
    super.initState();
  }

  void scan() async {
    String result = await scanner.scan();
    setState(() {
      scannerResult = result;
      PopDialog.showBottomDialog(
        context,
        Center(
            child: FutureBuilder<Parking>(
              future: futureParking,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Text(snapshot.data.plat);
                } else if (snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )),

      );
    });}
//
//  Column(
//  children: <Widget>[
//  parking.id == scannerResult?
//  Container(
//  child: Column(
//  children: <Widget>[
//  Text('id : $snapshot.data.id',style: TextStyle(fontSize: 20)),
//  Text('name : ${parking.name}',style: TextStyle(fontSize: 20)),
//  Text('price : ${parking.price}',style: TextStyle(fontSize: 20)),
//  Text('plat : ${parking.plat}',style: TextStyle(fontSize: 20)),
//  ],
//  ),
//  ) :
//  Text('Plat Tidak Ditemukan, $scannerResult '),
//
//  MainButton(
//  text: 'Submit',
//  onClickEvent: () {
//  submit();
//  },
//  ),
//  ],
//  );

  void submit() {
    setState(() {
      scannerResult = '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () => scan(),
            child: Column( // Replace with a Row for horizontal icon + text
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.touch_app, color: Colors.black45, size: 100,),
                SizedBox(height: 30,),
                Text('TAP HERE', style: TextStyle(color: Colors.black45,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
