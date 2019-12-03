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
                  top: 320.0,
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
                ),
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
        "As a Software Engineer working on Google's infrastructure, you have the opportunity to work on everything from the core platform that runs the world's largest distributed network to redefining the systems that allow applications and services to provide useful information to billions of users around the globe. From our Data Center software groups to Google Cloud Platform or Gmail to YouTube, our infrastructure engineers across departments wrestle with the vast scale of a ubiquitous system, its products and services and revolutionize industry leading technologies to handle the sheer magnitude at which Google operates.";
        break;

      case 1:
        placeDetails =
        "Understands and implements The 4 Step Selling Method, achieves personal sales minimums required by “Store Gold Star” program, helps maintain a visually appealing store, practices and implements all loss prevention policies and procedures";
        break;

      case 2:
        placeDetails =
        "Coordinates efforts to ensure that information systems support departmental and organizational objectives Work closely with departmental customers to translate business needs into HCM system functionality. Assist in a broad range of responsible and complex computer systems administration duties to implement, configure, maintain and optimize HCM Systems. Provide technical support for a combination of desktop and software applications, support the correction of application problems; and perform a variety of technical and functional tasks relative to assigned HCM application (s). The analyst should have in-depth knowledge of the HCM software, as well as University and Medical Center operations and workflows.";
        break;

      case 3:
        placeDetails =
        "Seasonal Service & Engagement:Advocates of guest experience who welcome, thank, and exceed guest service expectations by focusing on guest interaction and recovery.";
        break;

      case 4:
        placeDetails =
        "Known for being a great place to work and build a career, KPMG provides audit, tax and advisory services for organizations in today’s most important industries. Our growth is driven by delivering real results for our clients. It’s also enabled by our culture, which encourages individual development, embraces an inclusive environment, rewards innovative excellence and supports our communities. With qualities like those, it’s no wonder we’re consistently ranked among the best companies to work for by Fortune Magazine, Consulting Magazine, Working Mother Magazine, Diversity Inc. and others. If you’re as passionate about your future as we are, join our team.";
        break;
    }
  }
}
