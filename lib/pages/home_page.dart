import 'package:flutter/material.dart';
import 'dart:async';
import 'package:icebreaker/pages/messaging_convos.dart';
import 'package:icebreaker/pages/settings.dart';
import 'package:icebreaker/pages/startup_page.dart';
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
        leading: IconButton(icon:Icon(Icons.exit_to_app),
          onPressed: () {
            globals.currentUser = null;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StartupPage()));
          },
        ),
        backgroundColor: Color(0xFF6CB2E5),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed:() {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
            }
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagingConvos()));
            },

          )],
      ),
      body: Stack(alignment: Alignment.center, children: cardList),
    );
  }


  List<Widget> _generateCards() {
    List<profile_card> planetCard = new List();
    planetCard.add(
      profile_card(
          "Golden Retriever ",
          "http://cdn.akc.org/content/hero/golden_retriever_august_hero.jpg",
          70.0,
          true),
    );
    planetCard.add(
      profile_card(
          "Baby Cat ",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/1280px-Kitten_in_Rizal_Park%2C_Manila.jpg",
          80.0,
          true),
    );
    planetCard.add(
        profile_card(
        "Cinderblock",
        "https://ewscripps.brightspotcdn.com/dims4/default/6bba9e9/2147483647/strip/true/crop/1000x563+0+0/resize/1280x720!/quality/90/?url=https%3A%2F%2Fewscripps.brightspotcdn.com%2Fc0%2F29%2F8f7a12854b4ab1e56ec3a13b1cae%2Fcinderblock3.png",
        90.0,
        true));
    planetCard.add(
        profile_card(
        "Basset Hound",
        "http://geniusvets.s3.amazonaws.com/gv-dog-breeds/basset-hound-1.jpg",
        100.0,
        true));
    planetCard.add(
      profile_card(
          "Linux penguin ",
          "https://www.sccpre.cat/mypng/detail/33-339298_37-tux-linux-penguin-linux-penguin-no-background.png",
          110.0,
          true),
    );
    List<Widget> cardList = new List();

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
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
                          height: 440.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          planetCard[x].cardTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.purple,
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
                          height: 480.0,
                          width: 320.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            planetCard[x].cardTitle,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    )),
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
            ],
          );
        }
    );
  }
}


