import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:icebreaker/globals.dart' as globals;

class LoginPage extends StatefulWidget {

  State<StatefulWidget> createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  final _formKey = new GlobalKey<FormState>();
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email'
                      ),
                      onChanged: (newValue) {
                        email = newValue;
                      },
                      initialValue: email,
                      validator: (String value) {
                        if (email  == '') {
                          return 'Email cannot be blank';
                        }
                        return globals.allUsers.containsKey(email) ? null : 'That email does not have an associated account';
                      },
                    )
                  ],
                ),
              )
            ],
        )
      )
    );
  }
}