import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagingTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: appBar("Dino"),
    );
  }

  Widget appBar(var name){
    return new AppBar(
      title: Text(name),
      backgroundColor: Color(0xFF1D4489),
    );
  }

}