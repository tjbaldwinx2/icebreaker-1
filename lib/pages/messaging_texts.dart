import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messaging extends StatefulWidget {
  String name;
  Messaging(this.name);

  @override
  MessagingTexts createState() {
    return new MessagingTexts(name);
  }
}

class MessagingTexts extends State<Messaging> {
  String name;
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final myController = new TextEditingController();
  String currentMessage = '';
  final TextEditingController _controller = new TextEditingController();
  List<Bubble> messages = [
    Bubble(message: 'Hi there, this is a message', time: '12:00', delivered: true, isMe: false),
    Bubble(message: 'Nice to meet you!', time: '12:01', delivered: true, isMe: false,),
  ];

  MessagingTexts(String name) {
    this.name = name;
    if (name == 'Golden Retriever') {
      messages.add(Bubble(
        message: 'How about meeting tomorrow?',
        time: '12:00',
        delivered: true,
        isMe: true,
      ));
    }
    else if (name == 'Baby Cat') {
      messages.add(Bubble(
        message: 'Do you have any concerns for me?',
        time: '12:00',
        delivered: true,
        isMe: false,
      ));
    }
    else if (name == 'Cinderblock') {
      messages.add(Bubble(
        message: 'I wasn\'t aware of that let me check',
        time: '12:00',
        delivered: true,
        isMe: false,
      ));
    }
    else if (name == 'Basset Hound') {
      messages.add(Bubble(
        message: 'I am interested in programming',
        time: '12:00',
        delivered: true,
        isMe: false,
      ));
    }
    else {
      messages.add(Bubble(
        message: 'I understand',
        time: '12:00',
        delivered: true,
        isMe: false,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: message(context),
        appBar: appBar(),
        resizeToAvoidBottomInset: false
    );
  }

  Widget appBar() {
    return new AppBar(
      title: Text(name),
      backgroundColor: Color(0xFF6CB2E5),
    );
  }

  Widget message(BuildContext context) {
    return new Scaffold(
        body: Container(
            child: ListView(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height - 200,
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: messages
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Align(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              onChanged: (newValue) {
                                currentMessage = newValue;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      messages.add(createBubble(currentMessage));
                                      _controller.clear();
                                    });
                                  },
                                  icon: Icon(Icons.send)
                                ),
                                hintText: "Input message here",
                              ),
                          )
                        )
                      )
                  ),
                ]
            )
        )
    );
  }

  Widget newMessage(var text) {
    return new Card(
      child: Text(text),
    );
  }

  Bubble createBubble(String message) {
    return Bubble(
      isMe: true,
      message: message,
      time: TimeOfDay.now().hour.toString() + ":" + TimeOfDay.now().minute.toString(),
      delivered: true,
    );
  }
}

class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe});

  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Color(0xFF6CB2E5) : Colors.white ;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
             bottomRight: Radius.circular(10.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        ;
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

