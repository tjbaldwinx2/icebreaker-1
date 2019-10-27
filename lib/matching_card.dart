import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchingCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return cardImplement(screenSize);
  }

  Widget cardImplement(var screenSize) {
    return new Card(
      color: Colors.transparent,
      elevation: 4.0,
      child: new Container(
        width: screenSize.width/1.2,
        height: screenSize.height/1.2,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              width: screenSize.width/1.2,
              height: screenSize.height/1.4,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(8.0),
                  topRight: new Radius.circular(8.0)),
                color: Colors.purple,
              ),
            ),
            new Container(
              width: screenSize.width/1.2,
              height: screenSize.height/1.2 - screenSize.height/1.4,

              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //TODO: Add something here
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}