import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AbsencePresence{
  String id;
  DateTime dateTime;
  String title;
  String description;
//  String syncFlag;

  AbsencePresence({this.id,this.dateTime, this.title, this.description, /*this.syncFlag*/});

  Map<String, dynamic> toMap() {
    return {
      'id': Uuid().v1(),
      'title': title,
      'description': description,
//      'syncFlag': syncFlag
    };
  }
}

class Users{
  String id;
  String username;
  String password;

  Users({this.id,this.username,this.password});
}