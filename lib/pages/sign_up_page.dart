import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icebreaker/pages/recruiter_signup.dart';

class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: Column(
          children: <Widget>[
            ButtonTheme(
              minWidth: 200.0,
              height: 40.0,
              child:
                RaisedButton(
                  child: new Text('Recruiter Sign Up'),
                  color: Color(0xFF6CB2E5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecruiterSignUp())
                    );
                  },
                )
            )
          ],
        ),
      )
    );
  }

}