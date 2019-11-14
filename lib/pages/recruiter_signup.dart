import 'package:flutter/material.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/pages/home_page_recruiter.dart';
import 'package:icebreaker/profile.dart' as profile;

class PageOneRecruiter extends StatefulWidget {
  @override
  FirstPage createState() {
    return new FirstPage();
  }
}

class PageTwoRecruiter extends StatefulWidget {
  @override
  SecondPage createState() {
    return new SecondPage();
  }
}

class FirstPage extends State<PageOneRecruiter> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String company = '';
  String title = '';
  String password = '';
  String reenteredPassword;

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
            body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Text(
                          'Personal Information',
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                        child: Text(
                          '*Asterisk indicates required field',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'First Name*'
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
                                  labelText: 'Last Name*'
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
                                  labelText: 'Email*'
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
                                  labelText: 'Password*'
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
                                  labelText: 'Re-Enter Password*'
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
                                  labelText: 'Company Name*'
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
                                  labelText: 'Job Title*'
                              ),
                              onChanged: (newValue) {
                                title = newValue;
                              },
                              initialValue: title,
                              validator: (String value) {
                                return title == '' ? 'Job title cannot be blank' : null;
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
                                        if (_formKey.currentState.validate()) {
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
                                              MaterialPageRoute(builder: (context) => PageTwoRecruiter())
                                          );
                                        }
                                      }
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}

class SecondPage extends State<PageTwoRecruiter> {
  String positionTitle = '';
  String description = '';
  String education;
  String skillsRequired = '';
  String skillsDesired = '';
  String salary = '';
  String timeFrame = '';
  static GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();

  String educationValue;
  List<String> educationLevels = ['Select Highest Education Level', 'Some High School',
    'High School Graduate or equivalent', 'Some College or University',
    'Associate Degree', 'Bachelor\'s Degree', 'Master\'s Degree',
    'Professional Degree', 'Doctorate Degree', 'Other', 'Refuse to Answer'];


  @override
  Widget build(BuildContext context) {
    if (globals.currentUser != null && globals.currentUser.getPosition() != null) {
      positionTitle = globals.currentUser.getPosition().getTitle();
      description = globals.currentUser.getPosition().getDescription();
      education = globals.currentUser.getPosition().getEducation();
      skillsRequired = globals.currentUser.getPosition().getSkillsRequired();
      skillsDesired = globals.currentUser.getPosition().getSkillsDesired();
      salary = globals.currentUser.getPosition().getSalary();
      timeFrame = globals.currentUser.getPosition().getTimeFrame();
    }
    return new WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
            body: SingleChildScrollView(
                child: Form(
                  key: _formKey2,
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                          child: Text(
                            'Position Information',
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          )
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                        child: Text(
                          '*Asterisk indicates required field',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Position Title*'
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
                                  labelText: 'Description*'
                              ),
                              onChanged: (newValue) {
                                description = newValue;
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              initialValue: description,
                              validator: (String value) {
                                return description == '' ? 'Description cannot be blank' : null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Required Skills*'
                              ),
                              onChanged: (newValue) {
                                skillsRequired = newValue;
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              initialValue: skillsRequired,
                              validator: (String value) {
                                return skillsRequired == '' ? 'Required skills cannot be blank' : null;
                              },
                            ),
                            DropdownButtonFormField(
                              items: educationLevels.map((String educationLevel) {
                                return DropdownMenuItem(
                                    value: educationLevel,
                                    child: Text(educationLevel)
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                  labelText: 'Education Level*'
                              ),
                              onChanged: (newValue) {
                                education = newValue;
                                setState(() {
                                  educationValue = newValue;
                                });
                              },
                              value: educationValue == null ? education == null ? educationLevels[0] : education : educationValue,
                              validator: (value) {
                                if (education == 'Select Highest Education Level') {
                                  return 'Highest Education Level cannot be blank';
                                }
                                return education == '' ? 'Highest Education Level cannot be blank' : null;
                              },
                            ),
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Desired Skills'
                                ),
                                onChanged: (newValue) {
                                  skillsDesired = newValue;
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                initialValue: skillsDesired == '' ? null : skillsDesired
                            ),
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Salary'
                                ),
                                onChanged: (newValue) {
                                  skillsRequired = newValue;
                                },
                                initialValue: (salary == "") ? null : salary.toString()
                            ),
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Time Frame'
                                ),
                                onChanged: (newValue) {
                                  timeFrame = newValue;
                                },
                                initialValue: (timeFrame == '') ? null : timeFrame
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
                                                  MaterialPageRoute(builder: (context) => PageOneRecruiter())
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
                                              if (_formKey2.currentState.validate()) {
                                                globals.currentUser.createPosition(
                                                    positionTitle,
                                                    description,
                                                    education,
                                                    skillsRequired,
                                                    skillsDesired,
                                                    salary,
                                                    timeFrame
                                                );
                                                globals.allUsers[globals.currentUser.email] = globals.currentUser;
                                                globals.newUser = true;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => HomePageRecruiter())
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
                    ],
                  ),
                )
            )
        )
    );
  }
}