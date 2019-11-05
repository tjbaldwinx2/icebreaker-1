import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icebreaker/pages/home_page.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/profile.dart' as profile;

class PageOne extends StatefulWidget {
  @override
  FirstPage createState() {
    return FirstPage();
  }
}

class PageTwo extends StatefulWidget {
  @override
  SecondPage createState() {
    return SecondPage();
  }
}

class PageThree extends StatefulWidget {

  @override
  ThirdPage createState() {
    return ThirdPage();
  }
}

class FirstPage extends State<PageOne>{
  String firstName = '';
  String lastName = '';
  String email = '';
  String address = '';
  String race = '';
  String ethnicity = '';
  String disability = '';
  String password = '';
  String reenteredPassword;

  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<String> raceList = ['Select Race', 'White', 'Black or African American', 'Pacific Islander', 'Native American', 'Asian', 'More than One', 'Refuse to Answer'];
  List<String> ethnicityList = ['Select Ethnicity', 'Not Hispanic or Latino', 'Hispanic or Latino', 'Refuse to Answer'];
  List<String> disabilityList = ['Select Disability', 'I have a disability', 'I do not have a disability', 'Refuse to Answer'];

  String ethValue;
  String raceValue;
  String disabilityValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                      child: Text(
                        'Personal Information',
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
                              labelText: 'Address*',
                              helperText: 'Format as Street Address, City, State Zip Code'
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
                          items: raceList.map((String race) {
                            return new DropdownMenuItem(
                                value: race,
                                child: Text(race)
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                              labelText: 'Race*'
                          ),
                          onChanged: (newValue) {
                            race = newValue;
                            setState(() {
                              raceValue = newValue;
                            });
                          },
                          value: raceValue == null ? raceList[0] : raceValue,
                          validator: (value) {
                            if (race == 'Select Race') {
                              return 'Must select race';
                            }
                            return race == '' ? 'Race cannot be blank' : null;
                          },
                        ),
                        DropdownButtonFormField(
                          items: ethnicityList.map((String ethnicity) {
                            return DropdownMenuItem<String>(
                                value: ethnicity,
                                child: Text(ethnicity)
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                              labelText: 'Ethnicity*'
                          ),
                          onChanged: (newValue) {
                            ethnicity = newValue;
                            setState(() {
                              ethValue = newValue;
                            });
                          },
                          value: ethValue == null ? ethnicityList[0] : ethValue,
                          validator: (value) {
                            if (ethnicity == 'Select Ethnicity') {
                              return 'Must select ethnicity';
                            }
                            return ethnicity == '' ? 'Ethnicity cannot be blank' : null;
                          },
                        ),
                        DropdownButtonFormField(
                          items: disabilityList.map((String disability) => DropdownMenuItem(
                              value: disability,
                              child: Text(disability)
                          )
                          ).toList(),
                          onChanged: (newValue) {
                            disability = newValue;
                            setState(() {
                              disabilityValue = newValue;
                            });
                          },
                          value: disabilityValue == null ? disabilityList[0] : disabilityValue,
                          decoration: const InputDecoration(
                              labelText: 'Disability Disclosure*'
                          ),
                          validator: (value) {
                            if (disability == 'Select Disability') {
                              return 'Must select disability';
                            }
                            return disability == '' ? 'Disability disclosure cannot be blank' : null;
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
                                      if (globals.currentUser == null) {
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
                                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PageTwo())
                                      );
                                    }
                                  }
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}

class SecondPage extends State<PageTwo> {
  String typeOfEmployment = globals.currentUser.getTypeOfEmployment();

  static final GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();

  List<String> employmentList = ['Select Employment Type', 'Co-Op/Intern', 'Full-Time', 'Part-Time'];

  String employmentValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Form(
              autovalidate: true,
              key: _formKey2,
              child: Column(
                children: <Widget>[
                  Text(
                    'What type of employment are you seeking?',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  DropdownButtonFormField(
                    items: employmentList.map((String employment) {
                      return DropdownMenuItem(
                          value: employment,
                          child: Text(employment)
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                        labelText: 'Type of Employment*'
                    ),
                    onChanged: (newValue) {
                      typeOfEmployment = newValue;
                      setState(() {
                        employmentValue = newValue;
                      });
                    },
                    value: employmentValue == null ? typeOfEmployment == null ? employmentList[0] : typeOfEmployment : employmentValue,
                    validator: (value) {
                      if (typeOfEmployment == 'Select Employment Type') {
                        return 'Type of Employment cannot be blank';
                      }
                      return typeOfEmployment == '' ? 'Type of Employment cannot be blank' : null;
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
                                    globals.currentUser.addType(typeOfEmployment);
                                    print(globals.currentUser.getTypeOfEmployment());
                                    Navigator.pop(context);
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
                                    if (_formKey2.currentState.validate()) {
                                      globals.currentUser.addType(typeOfEmployment);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PageThree())
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

        )
    );
  }
}

class ThirdPage extends State<PageThree>{
  String title = globals.currentUser.getTitle() == null ? '' : globals.currentUser.getTitle();
  String summary = globals.currentUser.getSummary() == null ? '' : globals.currentUser.getSummary();
  String education = globals.currentUser.getEducation();
  String experience = globals.currentUser.getExperience() == null ? '' : globals.currentUser.getExperience();
  String skills = globals.currentUser.getSkills() == null ? '' : globals.currentUser.getSkills();
  String educationValue;

  static final GlobalKey<FormState> _formKey3 = new GlobalKey<FormState>();

  List<String> educationLevels = ['Select Highest Education Level', 'Some High School',
    'High School Graduate or equivalent', 'Some College or University',
    'Associate Degree', 'Bachelor\'s Degree', 'Master\'s Degree',
    'Professional Degree', 'Doctorate Degree', 'Other', 'Refuse to Answer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey3,
            child: Column(
              children: <Widget>[
                Text(
                  'Employment Information',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Current Title*',
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
                      labelText: 'Summary*'
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
                      labelText: 'Skills*'
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
                                  globals.currentUser.addInfo(title, summary, education, experience, skills);
                                  Navigator.pop(context);
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
                                  if (_formKey3.currentState.validate()) {
                                    globals.currentUser.addInfo(
                                        title,
                                        summary,
                                        education,
                                        experience,
                                        skills
                                    );
                                    globals.allUsers[globals.currentUser.email] = globals.currentUser;
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
        )
    );
  }
}