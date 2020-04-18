import 'package:flutter/material.dart';
import 'package:login_app/pages/scanner_page.dart';
import 'package:login_app/pages/search_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'pages//home_page.dart';
import 'pages/list_page.dart';
import 'pages/profile_page.dart';


class Bar extends StatefulWidget {
  static String tag = 'app';
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [HomePage(), ScannerPage(),SearchPage(), ListPage(), ProfilePage(),];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: Color.fromRGBO(208,52,47,1),
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_overscan),
        title: ("Barcode"),
        activeColor: Color.fromRGBO(208,52,47,1),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColor: Color.fromRGBO(208,52,47,1),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list),
        title: ("List"),
        activeColor: Color.fromRGBO(208,52,47,1),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColor: Color.fromRGBO(208,52,47,1),
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
//    PageController _myPage = PageController(initialPage: 0);
    return PersistentTabView(
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      showElevation: false,
      isCurved: true,
      backgroundColor: const Color(0xFFEBEEF1),
      iconSize: 26.0,
      navBarStyle: NavBarStyle.style5,
    );
  }
}