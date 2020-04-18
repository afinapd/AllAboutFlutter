import 'package:dio/dio.dart';

class DioService{
  var dio = Dio();
  var id;
  postLogin(username, password) async{
    try {
      Response response = await Dio().post("http://192.168.43.243:4000/login", data: {"username" : username, "password": password} );
      dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        var customHeaders = {
          'Content-Type': 'application/json',
          'Authorization':'Bearer ${response.data['token']}',
        };
        options.headers.addAll(customHeaders);
        return options;
      }));
//      print(response.data.toString());
      id = response.data['user']['userId'];
      return response.data;
    } catch (e) {
      throw(e);
    }
  }

  getModule() async{
    try {
      Response response = await dio.get("http://192.168.43.243:4000/getRoles?id=$id");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}

var dioService = DioService();