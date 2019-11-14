import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icebreaker/pages/applicant_signup.dart';
import 'package:icebreaker/pages/recruiter_signup.dart';
import 'package:icebreaker/pages/startup_page.dart';

class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        body: Container(
            padding: EdgeInsets.all(50.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                    "Are you a company recruiter or are you a job seeker?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24)),
                Container(
                    padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                    child: Column(
                        children: <Widget>[
                          ButtonTheme(
                              minWidth: 300.0,
                              height: 40.0,
                              child:
                              RaisedButton(
                                child: new Text(
                                  'Recruiter Sign Up',
                                  style: TextStyle(fontSize: 24, color: Color(0xFF6CB2E5)),
                                ),
                                color: Color(0xFF1D4489),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PageOneRecruiter())
                                  );
                                },
                              )
                          ),
                          ButtonTheme(
                              minWidth: 300.0,
                              height: 40.0,
                              child:
                              RaisedButton(
                                child: new Text(
                                    'Applicant Sign-Up',
                                    style: TextStyle(fontSize: 24, color: Color(0xFF1D4489))
                                ),
                                color: Color(0xFF6CB2E5),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PageOne())
                                  );
                                },
                              )
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: ButtonTheme(
                                  minWidth: 100.0,
                                  height: 40.0,
                                  child:
                                  RaisedButton(
                                    child: new Text(
                                      'Back',
                                      style: TextStyle(fontSize: 20, color: Color(0xFF6CB2E5)),
                                    ),
                                    color: Color(0xFF1D4489),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => StartupPage())
                                      );
                                    },
                                  )
                              )
                          )
                        ]
                    )
                )
              ],
            )
        ),
      )
    );
  }

}