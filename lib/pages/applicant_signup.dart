import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icebreaker/pages/home_page.dart';
import 'package:icebreaker/pages/login_page.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/profile.dart' as profile;

class ApplicantSignup extends StatefulWidget {
  @override
  SignupState createState() {
    return SignupState();
  }
}

class SignupState extends State<ApplicantSignup>{
  String firstName = '';
  String lastName = '';
  String email = '';
  String address = '';
  String race = '';
  String ethnicity = '';
  String disability = '';
  String typeOfEmployment = '';
  String title = '';
  String summary = '';
  String education = '';
  String experience = '';
  String skills = '';
  String password = '';
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
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
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
                    labelText: 'Address'
                ),
                onChanged: (newValue) {
                  address = newValue;
                },
                initialValue: address,
                validator: (String value) {
                  return address == '' ? 'Address cannot be blank' : null;
                },
              ),
              DropdownButtonFormField(
                items: globals.races.map((String race) {
                  return new DropdownMenuItem(
                    value: race,
                    child: Text(race)
                  );
                }).toList(),
                decoration: const InputDecoration(
                    labelText: 'Race'
                ),
                onChanged: (newValue) {
                  race = newValue;
                },
              ),
              DropdownButtonFormField(
                items: globals.ethnicities.map((String ethnicity) {
                  return new DropdownMenuItem(
                      value: ethnicity,
                      child: Text(ethnicity)
                  );
                }).toList(),
                decoration: const InputDecoration(
                    labelText: 'Ethnicity'
                ),
                onChanged: (newValue) {
                  ethnicity = newValue;
                },
              ),
              DropdownButtonFormField(
                items: globals.disabilities.map((String disability) => DropdownMenuItem(
                      value: disability,
                      child: Text(disability)
                  )
                ).toList(),
                decoration: const InputDecoration(
                    labelText: 'Disability Disclosure'
                ),
                onChanged: (newValue) {
                  disability = newValue;
                },
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: ButtonTheme(
                    minWidth: 200.0,
                    height: 40.0,
                    child: RaisedButton(
                        child: new Text(
                          'Next',
                          style: TextStyle(fontSize: 24, color: Color(0xFF1D4489)),
                        ),
                        color: Color(0xFF6CB2E5),
                        onPressed: () {
                          if (this._formKey.currentState.validate()) {
                            globals.currentUser = new profile.ApplicantProfile(
                                firstName,
                                lastName,
                                email,
                                password,
                                address,
                                race,
                                ethnicity,
                                disability
                            );
                            print(globals.currentUser);
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => page2())
                            );
                          }
                        }
                    )
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget page2() {
    return new Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Text(
              'What type of employment are you seeking?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            DropdownButtonFormField(
              items: globals.employments.map((String employment) {
                return new DropdownMenuItem(
                    value: employment,
                    child: Text(employment)
                );
              }).toList(),
              decoration: const InputDecoration(
                  labelText: 'Type of Employment'
              ),
              onChanged: (newValue) {
                typeOfEmployment = newValue;
              },
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonTheme(
                        minWidth: 100.0,
                        height: 40.0,
                        child: RaisedButton(
                            color: Color(0xFF1D4489),
                            child: new Text(
                                'Back',
                                style: TextStyle(fontSize: 24, color: Color(0xFF6CB2E5))
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => page1())
                              );
                            }
                        )
                    ),
                    ButtonTheme(
                        minWidth: 100.0,
                        height: 40.0,
                        child: RaisedButton(
                            child: new Text(
                              'Next',
                              style: TextStyle(fontSize: 24, color: Color(0xFF1D4489)),
                            ),
                            color: Color(0xFF6CB2E5),
                            onPressed: () {
                              if (this._formKey.currentState.validate()) {
                                globals.currentUser.addType(typeOfEmployment);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => page3())
                                );
                              }
                            }
                        )
                    ),
                  ],
                )
            )
          ],
        ),
      )
    );
  }

  Widget page3() {
    return new Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Text(
                'Employment Information',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Current Title'
                ),
                onChanged: (newValue) {
                  title = newValue;
                },
                initialValue: title,
                validator: (String value) {
                  return title == '' ? 'Current title cannot be blank' : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Summary'
                ),
                onChanged: (newValue) {
                  summary = newValue;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                initialValue: summary,
                validator: (String value) {
                  return summary == '' ? 'Summary cannot be blank' : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Skills'
                ),
                onChanged: (newValue) {
                  skills = newValue;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                initialValue: skills,
                validator: (String value) {
                  return skills == '' ? 'Skills cannot be blank' : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Education Level'
                ),
                onChanged: (newValue) {
                  education = newValue;
                },
                initialValue: education,
                validator: (String value) {
                  return education == '' ? 'Education level cannot be blank' : null;
                },
              ),
              TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Experience'
                  ),
                  onChanged: (newValue) {
                    experience = newValue;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  initialValue: experience
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 40.0,
                          child: RaisedButton(
                              color: Color(0xFF1D4489),
                              child: new Text(
                                  'Back',
                                  style: TextStyle(fontSize: 24, color: Color(0xFF6CB2E5))
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => page2())
                                );
                              }
                          )
                      ),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 40.0,
                          child: RaisedButton(
                              child: new Text(
                                'Submit',
                                style: TextStyle(fontSize: 24, color: Color(0xFF1D4489)),
                              ),
                              color: Color(0xFF6CB2E5),
                              onPressed: () {
                                if (this._formKey.currentState.validate()) {
                                  globals.currentUser.addInfo(
                                      title,
                                      summary,
                                      education,
                                      experience,
                                      skills
                                  );
                                  if (!globals.allUsers.containsKey(globals.currentUser.email)) {
                                    globals.allUsers[globals.currentUser.email] = globals.currentUser;
                                  }
                                  else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginPage())
                                    );
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomePage())
                                  );
                                }
                              }
                          )
                      ),
                    ],
                  )
              )
            ],
          ),
        )
    );
  }
}