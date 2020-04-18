import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:login_app/pages/absence_page.dart';
import 'package:login_app/utils/pop_dialog.dart';
import 'package:login_app/widgets/main_button.dart';
import 'package:qrscan/qrscan.dart' as scanner;



//  Widget _buildButtonColumn(Color color, IconData icon, String label) {
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: [
//        Icon(icon, color: color),
//        Container(
//          margin: const EdgeInsets.only(top: 8),
//          child: Text(
//            label,
//            style: TextStyle(
//              fontSize: 12,
//              fontWeight: FontWeight.w400,
//              color: color,
//            ),
//          ),
//        ),
//      ],
//    );
//  }

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showAbsenceForm() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: AbsencePage(),
          );
        });}

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
  Widget _buildContainerHome(IconData icon, String label) {
    return Container(
      height: 120,
      width: 120,
      child: Card(
        color: Color(0xFFEBEEF1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(icon, color: Colors.black45, size: 50,),
            SizedBox(height: 10,),
            Text(label, style: TextStyle(color: Colors.black45, fontSize: 18))
          ],
          ),
        ),
      );
  }

  Widget _buildRow(String label, String days, String text, Color color){
    return  Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black45)
      ),
      width: 80,
      child: Column(
        children: <Widget>[
          Text(label, style: TextStyle(fontSize: 16,color: Colors.black45),),
          Text(days, style: TextStyle(fontSize: 30, color: color),),
          Text(text, style: TextStyle(fontSize: 10,color: Colors.black45),),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/home.jpg',width: 500,height: 280,fit: BoxFit.cover,),
        Positioned(
          top: MediaQuery.of(context).size.height/4,
          left: MediaQuery.of(context).size.width/14,
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Hello Zayn Malik, ",textAlign:TextAlign.left, style: TextStyle(color: Colors.black45,fontSize: 30,fontWeight: FontWeight.w400),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Today, ${DateFormat('E, d MMM yyyy').format(DateTime.now())}',style: TextStyle(color: Colors.black45 ,wordSpacing: 1,fontSize: 15),),
                            Wrap(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.notifications,color: Colors.black45,),
                                  onPressed: (){},
                                )
                              ],
                            ),
                          ]),
                      SizedBox(height: 30,),
                      Text('Data ${DateFormat('MMMM').format(DateTime.now())}',style: TextStyle(color: Colors.black45 ,wordSpacing: 1,fontSize: 15),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildRow('PRESENCE','20','Days',Colors.green),
                          _buildRow('ABSENCE','2','Days',Colors.red),
                          _buildRow('ROD','5','Days',Colors.blue)
                        ],
                      ),
                    ]),
            ),
            )
    )),
        Positioned(
            bottom: MediaQuery.of(context).size.height/7,
            left: MediaQuery.of(context).size.width/7,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: (){},
                  child: Column(
                    children: <Widget>[
                      _buildContainerHome(Icons.settings_overscan,'PRESENCE')
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: showAbsenceForm,
                  child: Column(
                    children: <Widget>[
                      _buildContainerHome(Icons.alarm_off,"ABSENCE")
                    ],
                  ),
                )
            ],
          ),
        )

      ],
    );

//    return Container(
//      child: SingleChildScrollView(
//        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Image.asset('assets/home.jpg',width: 500,height: 280,fit: BoxFit.cover,),
//          Container(
//            padding: EdgeInsets.only(left: 20, right: 20),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                SizedBox(height: 15,),
//                Text("Hello Zayn Malik, ",textAlign:TextAlign.left, style: TextStyle(color: Colors.black45,fontSize: 30,fontWeight: FontWeight.w400),),
//                SizedBox(height: 20,),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Text('Today, ${DateFormat('E, d MMM yyyy').format(DateTime.now())}',style: TextStyle(color: Colors.black45 ,wordSpacing: 1,fontSize: 15),),
//                    Wrap(
//                      children: <Widget>[
//                        IconButton(
//                          icon: Icon(Icons.notifications,color: Colors.black45,),
//                          onPressed: (){},
//                        )
//                      ],
//                    ),
//                  ],
//                ),
//                Text("Looks like feel good.",style: TextStyle(color: Colors.black45 ,wordSpacing: 1,fontSize: 15),),
//                Text("Everything Attendance-Related in the Palm of Your Hands",style: TextStyle(color: Colors.black45 ,wordSpacing: 1,fontSize: 15),),
//                SizedBox(height: 30,),
//                SizedBox(height: 10,),
//              ],
//            ),
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              FlatButton(
//                onPressed: (){},
//                child: Column(
//                  children: <Widget>[
//                    _buildContainerHome(Icons.settings_overscan,'PRESENCE')
//                  ],
//                ),
//              ),
//              FlatButton(
//                onPressed: showAbsenceForm,
//                child: Column(
//                  children: <Widget>[
//                    _buildContainerHome(Icons.alarm_off,"ABSENCE")
//                  ],
//                ),
//              )
//            ],
//          ),
//        ],
//      ),
//    ),
//    );
  }
}
