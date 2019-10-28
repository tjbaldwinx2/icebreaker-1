import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagingTexts extends StatelessWidget {
  String _messages ="";
  final myController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: appBar("Dino"),
      body: message1(Text("dwiand"))
    );
  }

  Widget appBar(var name){
    return new AppBar(
      title: Text(name),
      backgroundColor: Color(0xFF1D4489),
    );
  }

  Widget message1(var contents){
    return new Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Text("Scott")


            )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:TextField(
              onSubmitted: onMessageSubmitted,
              controller: myController,
              decoration: InputDecoration(
                fillColor: Colors.black12, filled: true
              ),

            ),
          ),
        ]

      );

  }
  void onMessageSubmitted(String message) async {

  }

}