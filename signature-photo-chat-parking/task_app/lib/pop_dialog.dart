import 'package:flutter/material.dart';
import 'package:task_app/bottom_dialog.dart';
import 'package:task_app/loading_dialog.dart';


class PopDialog {
  static showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog();
        });
  }

  static showBottomDialog(BuildContext context, Widget message) {
    showDialog(
        context: context,
        builder: (context) {
          return BottomDialog(
            message: message,
          );
        });
  }
}