import 'package:flutter/material.dart';
import 'dart:async';
import 'package:icebreaker/pages/messaging_convos.dart';
import 'package:icebreaker/pages/settings.dart';
import 'package:icebreaker/pages/tutorial.dart';
import 'package:icebreaker/profile_card.dart';
import 'package:icebreaker/CardDetail.dart';
import 'package:icebreaker/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Widget> cardList = new List();

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }
//
  @override
  void initState() {
    super.initState();
    cardList = _generateCards();
    if (globals.newUser) {
      Future.delayed(Duration.zero, () => generateDialogue(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IceBreaker for Applicants"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed:() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            }
        ),
        backgroundColor: Color(0xFF6CB2E5),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagingConvos()));
            },
          )
        ],
      ),
      body: Stack(alignment: Alignment.center, children: cardList),
    );
  }


  List<Widget> _generateCards() {
    List<profile_card> planetCard = new List();
    planetCard.add(
      profile_card(
          "Google ",
          "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_160x56dp.png",
          70.0,
          true),
    );
    planetCard.add(
      profile_card(
          "Windsor Fashions",
          "https://media.glassdoor.com/eep/148941/1phot1.compress.gd.jpg",
          80.0,
          true),
    );
    planetCard.add(
        profile_card(
        "Systems Analyst",
        "https://www.whec.com/whecimages/repository/2019-06/university-of-rochester-.jpg",
        90.0,
        true));
    planetCard.add(
        profile_card(
        "Target Cashier",
        "https://corporate.target.com/_media/TargetCorp/about/images/stores/Upcoming_stores_hero.jpg?ext=.jpg",
        100.0,
        true));
    planetCard.add(
      profile_card(
          "KPMG",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/KPMG_logo.svg/1200px-KPMG_logo.svg.png",
          110.0,
          true),
    );
    List<Widget> cardList = new List();

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: 5,
          child: Draggable(
              onDragEnd: (drag) {
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: GestureDetector(
                onTap: () {
                  print("Hello All");
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(250, 112, 19, 179),
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: "imageTag",
                        child: Image.network(
                          planetCard[x].cardImage,
                          width: 320.0,
                          height: 400.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          planetCard[x].cardTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CardDetails(planetCard[x].cardImage, x);
                  }));
                },
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(250, 112, 19, 179),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            image: DecorationImage(
                                image: NetworkImage(planetCard[x].cardImage),
                                fit: BoxFit.cover),
                          ),
                          height: 470.0,
                          width: 320.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            planetCard[x].cardTitle,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 320,
                          //padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ButtonTheme(
                                  child: RaisedButton(
                                    child: new Text(
                                      'Reject',
                                      style: TextStyle(fontSize: 17, color: Color(0xFF1D4489)),
                                    ),
                                    color : Color(0xFF6CB2E5),
                                    onPressed: () {
                                      removeCards(x);
                                    },
                                  )
                              ),
                              ButtonTheme(
                                child: RaisedButton(
                                  child: new Text(
                                    'Apply',
                                    style: TextStyle(fontSize: 17, color: Color(0xFF6CB2E5)),
                                  ),
                                  color : Color(0xFF1D4489),
                                  onPressed: () {
                                    removeCards(x);
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              )
            ),
          ),
        );
      }
    return cardList;
  }

  void generateDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Welcome!"),
            content: new Text("You have successfully signed up for IceBreaker."),
            actions: <Widget>[
              ButtonTheme(
                  minWidth: 20.0,
                  height: 35.0,
                  child: RaisedButton(
                      child: new Text(
                        'Close',
                        style: TextStyle(fontSize: 18, color: Color(0xFF1D4489)),
                      ),
                      color: Color(0xFF6CB2E5),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  )
              ),
              ButtonTheme(
                  minWidth: 20.0,
                  height: 35.0,
                  child: RaisedButton(
                      child: new Text(
                        'Help',
                        style: TextStyle(fontSize: 18, color: Color(0xFF6CB2E5)),
                      ),
                      color: Color(0xFF1D4489),
                      onPressed: () {
                        globals.newUser = false;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tutorial())
                        );
                      }
                  )
              )
            ],
          );
        }
    );
  }
}


