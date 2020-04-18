import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_app/models/absence_presence.dart';

class HttpService{
  final url = 'https://login-app-27a34.firebaseio.com/absence_presence.json';

  addAbsence(AbsencePresence absence) async{
    try{
      final res = await http.post(url,
      body: json.encode({
        'title' : absence.title,
        'description' : absence.description,
//        'tanggal' : absence.dateTime,
      }));
      if(res.statusCode != 200){
        throw 'error';
      } else {
        print(json.decode(res.body));
      }
    } catch(error){
      print(error);
      throw(error);
    }
  }

  getAbsence() async{
    try{
      final resp = await  http.get(url);
      if (resp.statusCode != 200){
        throw 'error';
      } else{
        Map<String, dynamic> data = json.decode(resp.body);
        final List result = [];
        data.forEach((absId, absInfo) {
          result.add({
            'title': absInfo['title'],
            'description': absInfo['description'],
            'tanggal': absInfo['tanggal'],
          });
        });
        return result;
      }
    } catch(error){
      print(error);
      throw error;
    }
  }
}