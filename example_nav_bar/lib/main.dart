import 'package:examplenavbar/Absen.dart';
import 'package:examplenavbar/profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

//        primarySwatch: Colors.redAccent,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  final List<Widget> children = [
    Absen(),
    Profile(),
    Profile(),
    Profile(),
    Profile(),
  ];
  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEEF1),
      body: children[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(208, 52, 47, 1),
        onPressed: () {
          updateTabSelection(4);
        },

        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  updateTabSelection(0);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_made,
                  color: selectedIndex == 1
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_received,
                  color: selectedIndex == 2
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: selectedIndex == 3
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}