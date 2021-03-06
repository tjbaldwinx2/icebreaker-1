import 'package:flutter/material.dart';
import 'package:icebreaker/pages/messaging_convos.dart';
import 'package:icebreaker/pages/settings.dart';
import 'package:icebreaker/pages/tutorial.dart';
import 'package:icebreaker/profile_card.dart';
import 'package:icebreaker/CardDetailsRecruiter.dart';
import 'package:icebreaker/globals.dart' as globals;

class HomePageRecruiter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePageRecruiter> {
  List<Widget> cardList = new List();

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

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
        title: Text("IceBreaker for Recruiters"),
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
      body: Stack(alignment: Alignment.center, children: cardList)
    );
  }

  List<Widget> _generateCards() {
    List<profile_card> planetCard = new List();
    planetCard.add(
      profile_card(
          "Bob Smith ",
          "https://images-na.ssl-images-amazon.com/images/I/61-9qMOZiOL._UY606_.jpg",
          70.0,
          true),
    );
    planetCard.add(
      profile_card(
          "Taylor Berry ",
          "https://cdn2-www.thefashionspot.com/assets/uploads/gallery/ugliest-dresses/sibling-s15-049.jpg",
          80.0,
          true),
    );
    planetCard.add(
        profile_card(
            "Scott Willson ",
            "https://i.pinimg.com/originals/a3/02/31/a30231aef919248cf2670d0b6d4fcd8f.jpg",
            90.0,
            true));
    planetCard.add(
        profile_card(
            "Tyler Baldwin ",
            "https://www.tipsyelves.com/mas_assets/cache/image/2/d/5/a/450x-11610.Jpg",
            100.0,
            true));
    planetCard.add(
      profile_card(
          "Giselle Cole ",
          "https://a9p9n2x2.stackpathcdn.com/wp-content/blogs.dir/1/files/2015/11/successful-black-woman_Black-Enterprise.jpg",
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
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) { return CardDetails(planetCard[x].cardImage, x);}),
                  );
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
                                    'Accept',
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


