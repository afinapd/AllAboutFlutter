import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavButton extends StatelessWidget {
  final callback;
  final List<bool> selectedIndex;

  NavButton(@required this.callback, @required this.selectedIndex);

  Widget _miniButton( BuildContext context, IconData icon, String label){
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top:10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding : EdgeInsets.only(bottom: 10),
              child: FaIcon(icon,size :30)),
          Container(
            width: 150,
            child: Center(
              child: Text(label),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ToggleButtons(
          renderBorder: false,
          children: <Widget>[
            _miniButton(context, Icons.person, 'ABOUT ME'),
            _miniButton(context, FontAwesomeIcons.trophy, 'ACHIEVMENT'),
          ],
          isSelected: selectedIndex,
          color: Colors.black45,
          selectedColor: Color(0xFFEBEEF1),
          fillColor: Color.fromRGBO(208,52,47,1),
          borderRadius: BorderRadius.circular(10),
          onPressed: (int index){
            callback(index, selectedIndex);
          },
        )
      ],
    );
  }
}
