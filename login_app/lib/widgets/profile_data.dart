import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:persistent_bottom_nav_bar/utils/functions.utils.dart';

import '../auth.dart';

class ProfileData extends StatelessWidget {
  Widget _buildContainerProfile(IconData icon, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 4.0),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal:25 ),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 50.0,
          child: ListTile(
            leading: FaIcon(
              icon,
              color: Colors.black45,
              size: 20,
            ),
            title: Text(
              label,
              style:
              TextStyle(color: Colors.black45, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildContainerProfile(Icons.person, name),
          _buildContainerProfile(Icons.person_pin_circle, 'Project Manager'),
          _buildContainerProfile(Icons.cake, 'Jan 12 1993'),
          _buildContainerProfile(Icons.location_on, 'Bradford, West Yorkshire, Inggris'),
          _buildContainerProfile(Icons.phone, '+122 XXXX XXXX'),
          _buildContainerProfile(Icons.email, email),
          _buildContainerProfile(FontAwesomeIcons.globeAsia, 'zaynmalik.com'),
          _buildContainerProfile(FontAwesomeIcons.building, 'Berau Coal, PT'),
            FlatButton(
                        onPressed: () {
                          signOutGoogle();
                          pushNewScreen(
                            context,
                            screen: LoginPage(),
                            platformSpecific: false,
                            withNavBar: false,
                          );
                        },
                        child: Text('Sign Out',
                          style: TextStyle(color: Color.fromRGBO(208,52,47,1), fontSize: 15),
                      ),
                    )
        ],
      ),
    );
  }
}
