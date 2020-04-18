import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rbacapp/bloc/login_bloc.dart';
import 'package:rbacapp/bloc/login_event.dart';
import 'package:rbacapp/bloc/login_state.dart';
import 'package:rbacapp/profile_page.dart';

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

  List<Widget> _buildScreens=[];

  List<PersistentBottomNavBarItem> _navBarsItems = [];

  @override
  Widget build(BuildContext context) {
//    PageController _myPage = PageController(initialPage: 0);
    return BlocProvider(
      create: (_) => LoginBloc(),
      child : BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state){
          if(state is Waiting){
            BlocProvider.of<LoginBloc>(context).add(GetModule());
          }
          if(state is Success){
            print(state.data.toString());
            state.data['role']['modules'].forEach((data){
              switch(data['module']){
                case "Home" :
                  _navBarsItems.add(
                  PersistentBottomNavBarItem(
                    icon: Icon(Icons.home),
                    title: ("Home"),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.grey,
                    isTranslucent: false,
                  ),);
                  _buildScreens.add(ProfilePage());
                  break;
                case "Report" :
                  _navBarsItems.add(
                    PersistentBottomNavBarItem(
                      icon: Icon(Icons.list),
                      title: ("List"),
                      activeColor: Colors.blueGrey,
                      inactiveColor: Colors.grey,
                    ),);
                  _buildScreens.add(ProfilePage());
                  break;
                case "Profile" :
                  _navBarsItems.add(
                    PersistentBottomNavBarItem(
                      icon: Icon(Icons.person),
                      title: ("Profile"),
                      activeColor: Colors.blueGrey,
                      inactiveColor: Colors.grey,
                    ),);
                  _buildScreens.add(ProfilePage());
                  break;
              }
            });
            return PersistentTabView(
              controller: _controller,
              items: _navBarsItems,
              screens: _buildScreens,
              showElevation: false,
              backgroundColor: const Color(0xFFEBEEF1),
              iconSize: 26.0,
              navBarStyle: NavBarStyle.style5,
            );
          }
          return Center(
              child : CircularProgressIndicator()
          );
        }
      )
    );
  }
}


