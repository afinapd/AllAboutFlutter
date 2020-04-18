import 'package:flutter/material.dart';
import 'package:login_app/auth.dart';

import '../app_bar.dart';
import 'login_page.dart';
class InitScreen extends StatelessWidget {
  static String tag = 'init-page';

  @override
  Widget build(BuildContext context) {
    getCurrentUser().then((data) {
      data?.uid != null ? Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Bar();
          },
        ),
      ) : Navigator.of(context).pushNamed(LoginPage.tag);
    });
    return Container();
  }
}
