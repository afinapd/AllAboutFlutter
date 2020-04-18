import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_akhir_app/models/product.dart';

class HttpService{
  final url = 'https://project-akhir-d76f4.firebaseio.com/product.json';
getProducts() async{
  try{
    final resp = await  http.get(url);
    if (resp.statusCode != 200){
      throw 'error';
          } else{
      Map<String, dynamic> data = json.decode(resp.body);
      final List result = [];
      data.forEach((prodId, prodInfo) {
        result.add({
          'title': prodInfo['title'],
          'description': prodInfo['description'],
          'price': prodInfo['price'],
        });
      });
      return result;
    }
    } catch(error){
      print(error);
      throw error;
  }
}


//  Future<void> addProduct(Product product){
//    const url = 'https://project-akhir-d76f4.firebaseio.com/product.json';
//    http
//        .post(url,
//        body: json.encode({
//          'title':product.title,
//          'description':product.description,
//          'price':product.price,
//        }))
//        .then((http.Response resp){
//          if(resp.statusCode != 200){
//            throw 'error';
//          } else{
//          print(json.decode(resp.body));
//          }
//    }).catchError((error){
//      print(error);
//      throw error;
//    });
//  }


//
addProduct(Product product) async{
  try{
    final resp = await  http.post(url,
        body: json.encode({
          'title':product.title,
          'description':product.description,
          'price':product.price,
        }));
    if (resp.statusCode != 200){
      throw 'error';
          } else{
          print(json.decode(resp.body));
          }
    } catch(error){
      print(error);
      throw error;
  }
}
}