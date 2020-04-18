import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:task_app/chat_page.dart';
import 'package:task_app/photo_page.dart';
import 'package:task_app/scan_page.dart';
import 'package:task_app/signature_page.dart';


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
    return [SignaturePage(),PhotoPage(),ScanPage(),ChatPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.signature),
        title: ("Signature"),
        activeColor: Colors.black54,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.camera_front),
        title: ("Take Photo"),
        activeColor: Colors.black54,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_overscan),
        title: ("Scan QR"),
        activeColor: Colors.black54,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        title: ("Chat"),
        activeColor: Colors.black54,
        inactiveColor: Colors.grey,
        isTranslucent: false,
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
      backgroundColor: const Color(0xFFEBEEF1),
      iconSize: 26.0,
      navBarStyle: NavBarStyle.style5,
    );
  }
}