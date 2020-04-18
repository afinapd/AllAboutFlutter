import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rbacapp/login_page.dart';

class ProfilePage extends StatefulWidget {
  static String tag = 'profile-page';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  pushNewScreen(
                    context,
                    screen: LoginPage(),
                    platformSpecific: false,
                    withNavBar: false,
                  );
                } ,
//                {Navigator.push(context, new MaterialPageRoute(
//                    builder: (context) =>
//                    new LoginPage()));
//                    withNavBar:false},
                child: const Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 20)
                ),
              ),
            ],
          )
      ),
    );
  }
}