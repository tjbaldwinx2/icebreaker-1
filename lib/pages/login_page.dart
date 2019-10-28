import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/pages/home_page.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40.0),
        child: Form(
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
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password'
                ),
                onChanged: (newValue) {
                  password = newValue;
                },
                obscureText: true,
                initialValue: password,
                validator: (String value) {
                  return globals.allUsers[email].password == password ? null : 'Incorrect Password';
                },
              ),
              ButtonTheme(
                child: RaisedButton(
                    child: new Text(
                      'Sign-In',
                      style: TextStyle(fontSize: 24, color: Color(0xFF1D4489)),
                    ),
                    color: Color(0xFF6CB2E5),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage())
                        );
                      }
                    }
                ),
              )
            ],
          ),
        )
      )
    );
  }
}