import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icebreaker/pages/messaging_texts.dart';
import 'package:multi_page_form/multi_page_form.dart';
import 'package:icebreaker/globals.dart' as globals;
import 'package:icebreaker/profile.dart' as profile;

class MessagingConvos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar(),
      body: new Container(
        child: ListView.builder(
          itemCount: ChatModel.data.length,
          itemBuilder: (context, index) {
            ChatModel _model = ChatModel.data[index];
            return Column(
              children: <Widget>[
                Divider(
                  height: 12.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(_model.avatarUrl),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(_model.name),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        _model.datetime,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text(_model.message),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Messaging(_model.name)),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget appBar() {
    return new AppBar(
      title: Text("Open Conversations"),
      backgroundColor: Color(0xFF6CB2E5),
    );
  }
}

class ChatModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;

  ChatModel({this.avatarUrl, this.name, this.datetime, this.message});

  static final List<ChatModel> data = [
    ChatModel(
      avatarUrl: "http://cdn.akc.org/content/hero/golden_retriever_august_hero.jpg",
      name: "Golden Retriever",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    ChatModel(
      avatarUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/1280px-Kitten_in_Rizal_Park%2C_Manila.jpg",
      name: "Baby Cat",
      datetime: "19:22",
      message: "Do you have any concerns for me?",
    ),
    ChatModel(
      avatarUrl: "https://ewscripps.brightspotcdn.com/dims4/default/6bba9e9/2147483647/strip/true/crop/1000x563+0+0/resize/1280x720!/quality/90/?url=https%3A%2F%2Fewscripps.brightspotcdn.com%2Fc0%2F29%2F8f7a12854b4ab1e56ec3a13b1cae%2Fcinderblock3.png",
      name: "Cinderblock",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    ChatModel(
      avatarUrl: "http://geniusvets.s3.amazonaws.com/gv-dog-breeds/basset-hound-1.jpg",
      name: "Basset Hound",
      datetime: "11:05",
      message: "I am interested in programming!",
    ),
    ChatModel(
      avatarUrl: "https://www.sccpre.cat/mypng/detail/33-339298_37-tux-linux-penguin-linux-penguin-no-background.png",
      name: "Linux Penguin",
      datetime: "09:46",
      message: "I understand",
    )
  ];
}