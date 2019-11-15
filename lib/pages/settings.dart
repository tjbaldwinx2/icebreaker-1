import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:icebreaker/pages/home_page.dart';
import 'package:icebreaker/globals.dart' as globals;

class SettingsPage extends StatelessWidget{


  @override
  Widget build(buildContext){
    return Scaffold(
        appBar: appBar(),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Account Settings"),
        ),
            ListTile(
              title: Text("Discovery"),
            ),
            ListTile(
              title: Text("Notifications"),
            ),
            ListTile(
              title: Text("Help and Support"),
            ),
            ListTile(
              title: Text("Privacy Policy"),
            ),
            ListTile(
              title: Text("Terms of Service"),
            ),
            ListTile(
              title: Text("Licenses"),
            ),
          ]
        )
    );
    }

  Widget appBar(){
    return new AppBar(
      title: Text("Settings"),
      backgroundColor: Color(0xFF6CB2E5),
    );
  }

  }
