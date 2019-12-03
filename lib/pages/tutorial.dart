import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/pages/home_page.dart';
import 'package:icebreaker/pages/home_page_recruiter.dart';
import 'package:icebreaker/profile.dart';

class Tutorial extends StatelessWidget{

  @override
  final String description =
      "Thank you for using IceBreaker! When on the home screen or swiping portion of the application, "
      "swipe left to reject a job or applicant or swipe right to accepct a job canidate or apply to a job position. On the buttom of each card, there are two buttons corresponding to "
      "the swipe actions and function the same. Happy swiping!";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Tutorial"),
        automaticallyImplyLeading: false
      ),
      body: new Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            new Text(
              description,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ButtonTheme(
                  minWidth: 100.0,
                  height: 40.0,
                  child:
                  RaisedButton(
                    child: new Text(
                      'Back',
                      style: TextStyle(fontSize: 20, color: Color(0xFF1D4489)),
                    ),
                    color: Color(0xFF6CB2E5),
                    onPressed: () {
                      if (globals.currentUser is RecruiterProfile) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePageRecruiter()
                        ));
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePage()
                        ));
                      }
                    },
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

}


