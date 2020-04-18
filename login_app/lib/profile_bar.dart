import 'package:flutter/material.dart';
import 'package:login_app/widgets/nav_button.dart';
import 'package:login_app/widgets/profile_data.dart';

class ProfileBar extends StatefulWidget {
  static String tag = 'profile-bar';

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  int _selectedIndex=0;
  final List<Widget> _widgetOption =<Widget>[
    ProfileData(),
    Text('B')
  ];
  final List<bool> _option = List.generate(2, (_)=>false);
  
  void selectWidget(int index,_selection){
    setState(() {
      for(int i=0;i<_selection.length;i++){
        _selection[i]=i==index;
        i==index?_selectedIndex=i:null;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NavButton(selectWidget,_option),
          Container(
            child: _widgetOption.elementAt(_selectedIndex),
          )
        ],
      ),
    );
  }
}
