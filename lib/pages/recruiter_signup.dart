import 'package:flutter/material.dart';
import 'package:multi_page_form/multi_page_form.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/profile.dart' as profile;

class RecruiterSignUp extends StatefulWidget {
  @override
  SignupState createState() {
    return SignupState();
  }
}

class SignupData {
  String firstName = '';
  String lastName = '';
  String email = '';
  String company = '';
  String title = '';
  String positionTitle = '';
  String description = '';
  String education = '';
  String skillsRequired = '';
  String skillsDesired = '';
  double salary = -1;
  String timeFrame = '';
  String password;
}

class SignupState extends State<RecruiterSignUp>{
  String firstName = '';
  String lastName = '';
  String email = '';
  String company = '';
  String title = '';
  String positionTitle = '';
  String description = '';
  String education = '';
  String skillsRequired = '';
  String skillsDesired = '';
  double salary = -1;
  String timeFrame = '';
  String password;
  String reenteredPassword;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: Form(
          key: _formKey,
          child: page1()
        ),
      )
    );
  }

  Widget page1() {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Personal Information'),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First Name'
              ),
              onChanged: (newValue) {
                firstName = newValue;
              },
              initialValue: firstName,
              validator: (String value) {
                if (value == null) {
                  return 'First name cannot be blank';
                }
                return (firstName == '') ? 'First name cannot be blank' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Last Name'
              ),
              onChanged: (newValue) {
                lastName = newValue;
              },
              initialValue: lastName,
              validator: (String value) {
                return (lastName == '') ? 'Last name cannot be blank' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Email'
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (newValue) {
                email = newValue;
              },
              initialValue: email,
              validator: (String value) {
                if (email == '') {
                  return 'Email cannot be blank';
                }
                else if (!email.contains('@') || !email.contains('.')) {
                  return 'Invalid email';
                }
                else {
                  return null;
                }
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
              validator: (String value) {
                return password == '' ? 'Password cannot be blank' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Re-Enter Password'
              ),
              onChanged: (newValue) {
                reenteredPassword = newValue;
              },
              obscureText: true,
              validator: (String value) {
                return password != reenteredPassword ? 'Passwords must match' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Company Name'
              ),
              onChanged: (newValue) {
                company = newValue;
              },
              initialValue: company,
              validator: (String value) {
                return company == '' ? 'Company name cannot be blank' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Job Title'
              ),
              onChanged: (newValue) {
                title = newValue;
              },
              initialValue: title,
              validator: (String value) {
                return title == '' ? 'Job title cannot be blank' : null;
              },
            ),
            RaisedButton(
              child: new Text('Next'),
              onPressed: () {
                if (this._formKey.currentState.validate()) {
                  globals.currentUser = new profile.RecruiterProfile(
                      firstName,
                      lastName,
                      email,
                      password,
                      company,
                      title
                  );
                  print(globals.currentUser);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page2())
                  );
                }
              }
            )
          ],
        ),
      )
    );
  }

  Widget page2() {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Position Information'),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Position Title'
              ),
              onChanged: (newValue) {
                positionTitle = newValue;
              },
              initialValue: positionTitle,
              validator: (String value) {
                return positionTitle == '' ? 'Position title cannot be blank' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Description'
              ),
              onChanged: (newValue) {
                description = newValue;
              },
              keyboardType: TextInputType.multiline,
              initialValue: description,
              validator: (String value) {
                return description == '' ? 'Description cannot be blank' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Required Skills'
              ),
              onChanged: (newValue) {
                skillsRequired = newValue;
              },
              keyboardType: TextInputType.multiline,
              initialValue: skillsRequired,
              validator: (String value) {
                return skillsRequired == '' ? 'Description cannot be blank' : null;
              },
            ),
            RaisedButton(
                child: new Text('Back'),
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => page1())
                    );
                }
            ),
            RaisedButton(
                child: new Text('Submit'),
                onPressed: () {
                  if (this._formKey.currentState.validate()) {
                    globals.currentUser.createPosition(
                        positionTitle,
                        description,
                        education,
                        skillsRequired,
                        skillsDesired,
                        salary,
                        timeFrame
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => page2())
                    );
                  }
                }
            )
          ],
        ),
      )
    );
  }


}