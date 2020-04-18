import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';

class TabsBottomScreen extends StatefulWidget {
  @override
  _TabsBottomScreenState createState() => _TabsBottomScreenState();
}

class _TabsBottomScreenState extends State<TabsBottomScreen> {
  final List<Map<String,dynamic>>_pages=[
    {'page':CategoryScreen(),'title':'Categories'},
    {'page':FavoritesScreen(),'title':'Favorites'},
  ];

  int _selectedPageIndex=0;

  void _onSelectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text(_pages[_selectedPageIndex]['title'])
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text(_pages[_selectedPageIndex]['title'])
          )
        ],
      ),
    );
  }
}
