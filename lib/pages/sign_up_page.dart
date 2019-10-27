import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icebreaker/pages/recruiter_signup.dart';

class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: new Text('Recruiter'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecruiterSignUp())
                );
              },
            )
          ],
        ),
      )
    );
  }

}