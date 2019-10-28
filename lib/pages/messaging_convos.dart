import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icebreaker/pages/login_page.dart';
import 'package:icebreaker/pages/messaging_texts.dart';
import 'package:multi_page_form/multi_page_form.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/profile.dart' as profile;

class MessagingConvos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: appBar(),
      body: new Container(
          child: getButtons(context)),
    );
  }

  Widget appBar(){
    return new AppBar(
      title: Text("Open Conversations"),
      backgroundColor: Color(0xFF6CB2E5),
    );
  }

  Widget userCard(var name, context){
    return new RaisedButton(
      color: Color(0xFF6CB2E5),
      child: name,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessagingTexts()),
        );
      },
    );
  }

  Widget getButtons(context){
    List<Widget> list = new List<Widget>();
    list.add(userCard(Text("Giselle Cole"), context));
    list.add(userCard(Text("Tyler Baldwin"), context));
    list.add(userCard(Text("Taylor Berry"), context));
    list.add(userCard(Text("Scott Wilson"), context));
    list.add(userCard(Text("Cinderblock"), context));
    list.add(userCard(Text("Sidney Davis"), context));
    globals.allUsers.forEach((k, v) => list.add(userCard(Text("${v.firstName} ${v.lastName}"), context)));
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: list,
    );
  }

}
