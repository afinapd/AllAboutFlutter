import 'package:flutter/material.dart';
import 'package:login_app/pages/init_page.dart';
import 'package:login_app/pages/scanner_page.dart';
import 'package:login_app/pages/search_page.dart';
import 'package:path/path.dart';
import 'app_bar.dart';
import 'pages/home_page.dart';
import 'pages/list_page.dart';
import 'pages/profile_page.dart';
import 'pages/login_page.dart';


void main() => runApp(MyApp());
final routes = <String, WidgetBuilder>{
  LoginPage.tag: (context) => LoginPage(),
  HomePage.tag: (context) => HomePage(),
  ListPage.tag:(context) => ListPage(),
  ProfilePage.tag:(context) => ProfilePage(),
  Bar.tag:(context) => Bar(),
  ScannerPage.tag:(context) => ScannerPage(),
  SearchPage.tag:(context) => ScannerPage()
//  InitScreen.tag:(context) => InitScreen(),
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