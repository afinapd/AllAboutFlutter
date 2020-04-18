import 'package:flutter/material.dart';
import 'package:task_app/app_bar.dart';
import 'package:task_app/login_page.dart';

void main() => runApp(MyApp());
final routes = <String, WidgetBuilder>{
  LoginPage.tag: (context) => LoginPage(),
  Bar.tag: (context) => Bar(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}