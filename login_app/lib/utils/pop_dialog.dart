import 'package:flutter/material.dart';
import 'package:login_app/widgets/bottom_dialog.dart';
import 'package:login_app/widgets/loading_dialog.dart';

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
