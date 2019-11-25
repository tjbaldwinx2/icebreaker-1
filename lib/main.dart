import 'package:flutter/material.dart';
import 'package:icebreaker/pages/applicant_signup.dart';
import 'package:icebreaker/pages/home_page.dart';
import 'package:icebreaker/pages/home_page_recruiter.dart';
import 'package:icebreaker/pages/messaging_convos.dart';
import 'package:icebreaker/pages/messaging_texts.dart';
import 'package:icebreaker/pages/recruiter_signup.dart';
import 'package:icebreaker/pages/sign_up_page.dart';
import 'package:icebreaker/pages/startup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'IceBreaker',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: new StartupPage(),
      routes: {
        '/signup': (context) => SignUpPage(),
        '/applicant_signup': (context) => PageOne(),
        '/recruiter_signup': (context) => PageOneRecruiter(),
        '/applicant_signup_page2': (context) => PageTwo(),
        '/applicant_signup_page3': (context) => PageThree(),
        '/recruiter_signup_page2': (context) => PageTwoRecruiter(),
        '/home_applicant': (context) => HomePage(),
        '/home_recruiter': (context) => HomePageRecruiter(),
        '/message_convos': (context) => MessagingConvos()
      },
    );
  }
}

