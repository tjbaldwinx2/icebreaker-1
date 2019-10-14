import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("IceBreaker"),
        ),
        body: Stack(
          children: <Widget>[
            //showForm(),
            showCircularProgress(),
          ],
        )
    );
  }

  Widget showCircularProgress(){
    bool _isLoading = true;

    if (_isLoading){
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
}