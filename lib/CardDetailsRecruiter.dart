import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  int index;
  String imageAddress;
  String placeDetails;

  CardDetails(this.imageAddress, this.index);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardDetailsState(imageAddress, index);
  }
}

class CardDetailsState extends State<CardDetails> {
  int index;
  String imageAddress;
  String placeDetails;

  CardDetailsState(this.imageAddress, this.index);

  @override
  void initState() {
    super.initState();
    setState(() {
      getData(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(index);
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 800.0,
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 500.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageAddress),
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                  top: 420.0,
                  left: 10.0,
                  right: 10.0,
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 380.0,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(20.0)
                      ),
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 10.0,
                        top: 20.0,
                      ),
                      child: Text(
                        placeDetails,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getData(value) {
    switch (value) {
      case 0:
        placeDetails =
        "I am looking for a new drug lord. I really wanna sell some cocaine and pot :D";
        break;

      case 1:
        placeDetails =
        "I am the best fashion designer! I went to Trump University!";
        break;

      case 2:
        placeDetails =
        "Please hire me. I'll sell you  secrets for cheap if you hire me. You may also impeach Trump. ";
        break;

      case 3:
        placeDetails =
        "I need a a job so i can make money";
        break;

      case 4:
        placeDetails =
        "I need a software enginnering job!!! ";
        break;
    }
  }
}
