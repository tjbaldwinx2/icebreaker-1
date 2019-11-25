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
    var data = index.toString();
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
        "The cute dog is cute";
        break;

      case 1:
        placeDetails =
        "This is a baby cat. Very cute! See BuzzFeed for the 20 cutest cats!";
        break;

      case 2:
        placeDetails =
        "This viral cat needs to lose weight. For more infomation, visit Reddit.";
        break;

      case 3:
        placeDetails =
        "This is a cute basset hound.";
        break;

      case 4:
        placeDetails =
        "Because of climate change, all penguins have been extinct. There is the Linux pengun. It is the only pengun that surveived.";
        break;
    }
  }
}
