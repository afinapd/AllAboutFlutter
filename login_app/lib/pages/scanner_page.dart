import 'package:flutter/material.dart';
import 'package:login_app/utils/pop_dialog.dart';
import 'package:login_app/widgets/main_button.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScannerPage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String scannerResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void scan() async {
    String result = await scanner.scan();
    setState(() {
      scannerResult = result;
      PopDialog.showBottomDialog(
        context,
        Center(
            child: Column(
              children: <Widget>[
                Text(scannerResult),

                MainButton(
                  text: 'Submit',
                  onClickEvent: () {
                    submit();
                  },
                ),
              ],
            )),

      );
    });}

  void submit() {
    setState(() {
      scannerResult = '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () => scan(),
            child: Column( // Replace with a Row for horizontal icon + text
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.touch_app, color: Colors.black45, size: 100,),
                SizedBox(height: 30,),
                Text('TAP HERE', style: TextStyle(color: Colors.black45,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
