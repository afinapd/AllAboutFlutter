import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../auth.dart';
import '../profile_bar.dart';


class ProfilePage extends StatelessWidget {
  static String tag = 'profile-page';

  @override
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
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 280,),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, index) => ListTile(
                        title: ProfileBar(),
                ),
                childCount: 1,
              ),
            )
//            SliverList(
//              delegate: SliverChildListDelegate([
//                SizedBox(height: 20,),
//                _buildContainerProfile(Icons.person, name),
//                _buildContainerProfile(Icons.person_pin_circle, 'Project Manager'),
//                _buildContainerProfile(Icons.cake, 'Jan 12 1993'),
//                _buildContainerProfile(Icons.location_on, 'Bradford, West Yorkshire, Inggris'),
//                _buildContainerProfile(Icons.phone, '+122 XXXX XXXX'),
//                _buildContainerProfile(Icons.email, email),
//                _buildContainerProfile(FontAwesomeIcons.globeAsia, 'zaynmalik.com'),
//                _buildContainerProfile(FontAwesomeIcons.building, 'Berau Coal, PT'),
//                ConstrainedBox(
//                  child: Column(
//                    children: <Widget>[
//                    FlatButton(
//                        onPressed: () {
//                          signOutGoogle();
//                          pushNewScreen(
//                            context,
//                            screen: LoginPage(),
//                            platformSpecific: false,
//                            withNavBar: false,
//                          );
//                        },
//                        child: Text('Sign Out',
//                          style: TextStyle(color: Color.fromRGBO(208,52,47,1), fontSize: 15),
//                      ),
//                    )],
//                  ),
//                  constraints: BoxConstraints(maxHeight: 50.0, minHeight: 50.0),
//                ),]),
//            ),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(color:  Color.fromRGBO(208,52,47,1),),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Zayn Malik",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 8 - shrinkOffset,
          left: MediaQuery.of(context).size.width/3.1,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
              child: Column(
                children: <Widget>[
                Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageURL),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(Radius.circular(75.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ])),
                      SizedBox(height: 20.0),
                      Text(
                        'Zayn Malik',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Project Manager',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

//class ProfilePage extends StatefulWidget {
//  static String tag = 'profile-page';
//  @override
//  _ProfilePageState createState() => _ProfilePageState();
//}
//
//class _ProfilePageState extends State<ProfilePage> {
//  @override
//  Widget _buildContainerProfile(IconData icon, String label) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        SizedBox(height: 4.0),
//        Container(
//          margin: EdgeInsets.symmetric(vertical: 10,horizontal:25 ),
//          alignment: Alignment.centerLeft,
//          decoration: BoxDecoration(
//            color: Colors.white54,
//            borderRadius: BorderRadius.circular(10.0),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.black12,
//                blurRadius: 6.0,
//                offset: Offset(0, 2),
//              ),
//            ],
//          ),
//          height: 50.0,
//          child: ListTile(
//            leading: FaIcon(
//              icon,
//              color: Colors.black45,
//              size: 20,
//            ),
//            title: Text(
//              label,
//              style:
//              TextStyle(color: Colors.black45, fontSize: 16),
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: CustomScrollView(
//          slivers: <Widget>[
//          SliverAppBar(
//              backgroundColor: Color.fromRGBO(208,52,47,1),
//              pinned: true,
//              expandedHeight: MediaQuery.of(context).size.height/3,
//              flexibleSpace: FlexibleSpaceBar(
//                centerTitle: true,
//                title: Text('Zayn Malik',
//                  style: TextStyle(
//                      fontSize: 20.0,
//                      fontWeight: FontWeight.bold,
//                      fontFamily: 'Montserrat',
//                      color: Colors.white),
//                ),
//                background: Column(
//                  children: <Widget>[
//                    SizedBox(height: 50,),
//                    Container(
//                        width: 130,
//                        height: 130,
//                        decoration: BoxDecoration(
//                            image: DecorationImage(
//                                image: AssetImage('assets/photo_profile.jpg'),
//                                fit: BoxFit.cover),
//                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
//                            boxShadow: [
//                              BoxShadow(blurRadius: 7.0, color: Colors.black)
//                            ])),
////                    SizedBox(height: 80.0),
////                    Text('Project Manager',
////                      style: TextStyle(
////                          fontSize: 17.0,
////                          fontStyle: FontStyle.italic,
////                          fontFamily: 'Montserrat',
////                          color: Colors.white),
////                    ),
//                  ],
//                ),
//              ),
//          ),
//            SliverList(
//              delegate: SliverChildListDelegate([
//                _buildContainerProfile(Icons.person_pin_circle, 'Project Manager'),
//                _buildContainerProfile(Icons.cake, 'Jan 12 1993'),
//                _buildContainerProfile(Icons.location_on, 'Bradford, West Yorkshire, Inggris'),
//                _buildContainerProfile(Icons.phone, '+022 XXXX XXXX'),
//                _buildContainerProfile(Icons.email, 'zaynmalik@yowmail.com'),
//                _buildContainerProfile(FontAwesomeIcons.globeAsia, 'zaynmalik.com'),
//                _buildContainerProfile(FontAwesomeIcons.building, 'Berau Coal, PT'),
//                ConstrainedBox(
//                  child: Column(
//                    children: <Widget>[
//                    FlatButton(
//                        onPressed: () {
//                          signOutGoogle();
//                          pushNewScreen(
//                            context,
//                            screen: LoginPage(),
//                            platformSpecific: false,
//                            withNavBar: false,
//                          );
//                        },
//                        child: Text('Sign Out',
//                          style: TextStyle(color: Color.fromRGBO(208,52,47,1), fontSize: 15),
//                      ),
//                    )],
//                  ),
//                  constraints: BoxConstraints(maxHeight: 50.0, minHeight: 50.0),
//                ),]),
//            ),
//        ]
//      ),
//    );
//  }
//}

//  @override
//  Widget _buildContainerProfile(IconData icon, String label) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        SizedBox(height: 4.0),
//        Container(
//          margin: EdgeInsets.symmetric(vertical: 10,horizontal:25 ),
//          alignment: Alignment.centerLeft,
//          decoration: BoxDecoration(
//            color: Colors.white54,
//            borderRadius: BorderRadius.circular(10.0),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.black12,
//                blurRadius: 6.0,
//                offset: Offset(0, 2),
//              ),
//            ],
//          ),
//          height: 50.0,
//          child: ListTile(
//            leading: Icon(
//              icon,
//              color: Colors.black45,
//              size: 20,
//            ),
//            title: Text(
//              label,
//              style:
//              TextStyle(color: Colors.black45, fontSize: 16),
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//      return Scaffold(
//          body: Stack(
//            children: <Widget>[
//              Positioned(
//                  width: MediaQuery.of(context).size.width,
//                  top: MediaQuery.of(context).size.height/15,
//                  child: Column(
//                    children: <Widget>[
//                      Container(
//                          width: 130,
//                          height: 130,
//                          decoration: BoxDecoration(
//                              image: DecorationImage(
//                                  image: AssetImage('assets/photo_profile.jpg'),
//                                  fit: BoxFit.cover),
//                              borderRadius: BorderRadius.all(Radius.circular(75.0)),
//                              boxShadow: [
//                                BoxShadow(blurRadius: 7.0, color: Colors.black)
//                              ])),
//                      SizedBox(height: 20.0),
//                      Text(
//                        'Zayn Malik',
//                        style: TextStyle(
//                            fontSize: 30.0,
//                            fontWeight: FontWeight.bold,
//                            fontFamily: 'Montserrat'),
//                      ),
//                      SizedBox(height: 15.0),
//                      Text(
//                        'Project Manager',
//                        style: TextStyle(
//                            fontSize: 17.0,
//                            fontStyle: FontStyle.italic,
//                            fontFamily: 'Montserrat'),
//                      ),
//                      SizedBox(height: 15.0),
//                      _buildContainerProfile(Icons.phone, '+022 XXXX XXXX'),
//                      _buildContainerProfile(Icons.email, 'zaynmalik.co.uk'),
//                      _buildContainerProfile(Icons.cake, 'Jan 12 1993'),
//                      _buildContainerProfile(Icons.location_on, 'Bradford'),
//                      FlatButton(
//                        onPressed: () {
//                          signOutGoogle();
//                          pushNewScreen(
//                            context,
//                            screen: LoginPage(),
//                            platformSpecific: false,
//                            withNavBar: false,
//                          );
//                        },
//                        child: Text('Sign Out',
//                          style: TextStyle(color: Color.fromRGBO(208,52,47,1), fontSize: 15),
//                      ),
//                      )],
//                  ))
//            ],
//          ));
//    }
//  }