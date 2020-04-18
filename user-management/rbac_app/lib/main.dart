import 'package:flutter/material.dart';
import 'package:rbacapp/app_bar.dart';
import 'package:rbacapp/login_page.dart';
import 'package:rbacapp/profile_page.dart';

void main() => runApp(MyApp());
final routes = <String, WidgetBuilder>{
//  '/': (_) => LoginPage(),
  LoginPage.tag: (context) => LoginPage(),
  ProfilePage.tag:(context) => ProfilePage(),
  Bar.tag:(context) => Bar()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.tag,
      routes: routes
    );
  }
}