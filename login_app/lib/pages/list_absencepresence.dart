import 'package:flutter/material.dart';
import 'package:login_app/services/http_service.dart';

class ListAbsencePresence extends StatefulWidget {
  @override
  _ListAbsencePresenceState createState() => _ListAbsencePresenceState();
}

class _ListAbsencePresenceState extends State<ListAbsencePresence> {
  List absences;
  var _isLoading = true;

  getAbsence() async {
    List result = await HttpService().getAbsence();
    setState(() {
      absences = result;
      _isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    getAbsence();
  }

  Future<void> refresh(){
    return getAbsence();
  }

  @override
  Widget build(BuildContext context){
    return Container(
        height: 400,
        child: _isLoading ?
        Container(
          height: 200,
          child: Center(child: CircularProgressIndicator(),),)
            : RefreshIndicator(
          onRefresh: refresh,
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(itemBuilder: (context,index){
                  return absences == null ?
                  Container()
                      : ListTile(
                    title: Text(absences[index]['title']),
                    subtitle: Text(absences[index]['description']),);
                },
                  itemCount: absences==null?0: absences.length,
                ),
              )
            ],
          ),)
    );
  }
}
