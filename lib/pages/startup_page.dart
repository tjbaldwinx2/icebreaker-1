import 'package:flutter/material.dart';

class StartupPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _StartupPageState();

}

class _StartupPageState extends State<StartupPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          page(),
        ],
      ),
    );
  }

  Widget page(){
    return new Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: new Form(
        //key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                logo(),
                new Text("Welcome to IceBreaker,\nthe revolutionary\nway to apply to jobs!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24)),
                buttons(),
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget logo(){
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 150.0,
          child: Image.asset('images/Logo.png'),
        ),
      ),
      /*child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 200.0,
        child: Image.asset('images/Logo.png'),
      ),*/
    );
  }

  Widget buttons(){
    return new Container(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text("Sign in"),
            color: Colors.blueAccent[600],
            onPressed: null,),
          new RaisedButton(
            child: new Text("Sign up"),
            color: Colors.blue,
             onPressed: null,
          )
        ],
      ),
    );
  }
}