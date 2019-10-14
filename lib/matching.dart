import 'package:flutter/material.dart';

class Matching extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MatchingState();

}

class _MatchingState extends State<Matching> {

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
       //dropdown(),
      ],
    );
  }


  Widget profileCardHolder() {
    return new Container(
      //Some kind of check : distinguish recruiter v applicant and insert info
    );
  }

  /*Widget dropdown(){
    return new DropdownButton(
      icon: Icon(Icons.menu),
      value: dropdownValue,
      onChanged: (DropdownMenuItem newValue){
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <DropdownMenuItem>[profile(), account(), settings()],
    );*/
  }

  Widget profile(){
    return new DropdownMenuItem(
      child: Text("Profile"),
      //key: profileMenu,
      //value: INSERT FILE NAME HERE,
    );
  }

  Widget account(){
    return new DropdownMenuItem(
      child: Text("Account Info"),
      //key: accountMenu,
      //value: INSERT FILE NAME HERE,
    );
  }

  Widget settings(){
    return new DropdownMenuItem(
      child: Text("Settings"),
      //key: settingsMenu,
      //value: INSERT FILE NAME HERE,
    );
  }
