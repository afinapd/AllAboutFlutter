import 'package:flutter/material.dart';
import 'package:login_app/bloc/image_bloc.dart';
import 'package:login_app/repositories/image_repository.dart';
import 'package:login_app/widgets/display_data.dart';

class SearchPage extends StatelessWidget {
  static String tag = 'search-page';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (val) {
                        ImageBloc().getImage(ImageRepository().getImage(val));
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search for anything...'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: DisplayData(),
            )
          ],
        ),
    );
  }
}
