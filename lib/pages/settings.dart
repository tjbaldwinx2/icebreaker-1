import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/pages/startup_page.dart';

class SettingsPage extends StatelessWidget{


  @override
  Widget build(buildContext){
    return Scaffold(
        appBar: appBar(),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Account Settings"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
            ListTile(
              title: Text("Notifications"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
            ListTile(
              title: Text("Help and Support"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
            ListTile(
              title: Text("Privacy Policy"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
            ListTile(
              title: Text("Terms of Service"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
            ListTile(
              title: Text("Licenses"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
              onTap: () {
                generateAlert(buildContext);
              },
            )
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

  void generateAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Confirm Logout"),
            content: new Text("Are you sure you want to logout of IceBreaker?"),
            actions: <Widget>[
              ButtonTheme(
                  minWidth: 20.0,
                  height: 35.0,
                  child: FlatButton(
                      child: new Text(
                        'Close',
                        style: TextStyle(fontSize: 18, color: Color(0xFF6CB2E5)),
                      ),
                      color: Color(0xFF1D4489),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  )
              ),
              ButtonTheme(
                  minWidth: 20.0,
                  height: 35.0,
                  child: FlatButton(
                      child: new Text(
                        'Logout',
                        style: TextStyle(fontSize: 18, color: Color(0xFF1D4489)),
                      ),
                      color: Color(0xFF6CB2E5),
                      onPressed: () {
                        globals.currentUser = null;
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StartupPage())
                        );
                      }
                  )
              ),
            ]
          );
        }
    );
  }

}
