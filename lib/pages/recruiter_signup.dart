import 'package:flutter/material.dart';
import 'package:multi_page_form/multi_page_form.dart';
import 'package:icebreaker/globals.dart' as globals;

class RecruiterSignUp extends StatefulWidget {
  @override
  SignupState createState() {
    return SignupState();
  }
}

class data {
  String firstName;
  String lastName;
  String email;
}

class SignupState extends State<RecruiterSignUp>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiPageForm(
      totalPage: 2,
      pageList: <Widget>[page1(), page2()],
      onFormSubmitted: () {
        //globals.currentUser = new Profile()
      },
    );
  }

  Widget page1() {

  }

  Widget page2() {

  }


}