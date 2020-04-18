import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rbacapp/app_bar.dart';
import 'package:rbacapp/bloc/login_bloc.dart';
import 'package:rbacapp/bloc/login_event.dart';

import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: Image.asset('assets/logo.jpg', width: 100, height: 100, fit:BoxFit.contain),
      ),
    );
  }
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        controller: username,
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        controller: password,
      ),
    );
  }

  Widget showPrimaryButton(context) {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(30.0)),
            color: Colors.blueGrey,
            child: Text('Login', style: TextStyle(fontSize: 20.0, color: Colors.white),),
            onPressed: ()
            { BlocProvider.of<LoginBloc>(context).add(Login(username: username.text, password: password.text));}
          ),
        ));
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state){
            if(state is Error){
              return AlertDialog(
                title: new Text("Alert Dialog title"),
                content: new Text("Alert Dialog body"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("Close"),
                    onPressed: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        settings: RouteSettings(name: '/'),
                        screen: LoginPage(),
                        platformSpecific: false,
                        withNavBar: true,
                      );
                    },
                  ),
                ],
              );
            }
            if(state is Waiting){
              return Container(
                  padding: EdgeInsets.all(16.0),
                  child: new Form(
                    child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        showLogo(),
                        showEmailInput(),
                        showPasswordInput(),
                        showPrimaryButton(context),
                      ],
                    ),
                  ));
            }
            if (state is Success){
                run() async {
                   await Future.delayed(const Duration(seconds: 1));
                   Navigator.of(context).pushReplacementNamed(Bar.tag);
                }
                run();
                return Container(
                    child: Center (
                      child: CircularProgressIndicator(),
                    ));
            }
            return CircularProgressIndicator();
          }
        )
      )
    );
  }}