import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blueGrey,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold)
        )
      ),
//      home: CategoryScreen(),
      initialRoute:'/',
      routes:{
        '/':(_)=>TabsScreen(),
        CategoryMealsScreen.ROUTE_NAME:(_)=>CategoryMealsScreen(),
        MealDetailScreen.ROUTE_NAME:(_)=>MealDetailScreen()
    },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Navigation'),
      ),
    );
  }
}
