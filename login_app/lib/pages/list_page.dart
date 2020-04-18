import 'package:flutter/material.dart';
import 'package:login_app/services/http_service.dart';

import 'list_absencepresence.dart';

//class ListPage extends StatefulWidget {
//  static String tag = 'list-page';
//
//  @override
//  _ListPageState createState() => _ListPageState();
//}


class ListPage extends StatelessWidget {
  static String tag = 'list-page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              color:  Color.fromRGBO(208,52,47,1),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    TabBar(
                      indicatorColor: Color(0xFFEBEEF1),
                      tabs: [
                      Tab(icon: Icon(Icons.playlist_add_check, size: 30,), text: 'List Absence Presence'),
                      Tab(icon: Icon(Icons.format_line_spacing), text: 'Need Approval')
                    ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ListAbsencePresence(),
              Text('dua'),
            ],
          ),
        ),
      ),
    );
  }
}



