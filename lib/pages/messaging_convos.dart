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
      avatarUrl: "https://images-na.ssl-images-amazon.com/images/I/61-9qMOZiOL._UY606_.jpg",
      name: "Bob Smith",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    ChatModel(
      avatarUrl: "https://cdn2-www.thefashionspot.com/assets/uploads/gallery/ugliest-dresses/sibling-s15-049.jpg",
      name: "Taylor Berry",
      datetime: "19:22",
      message: "Do you have any concerns for me?",
    ),
    ChatModel(
      avatarUrl: "https://i.pinimg.com/originals/a3/02/31/a30231aef919248cf2670d0b6d4fcd8f.jpg",
      name: "Scott Wilson",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    ChatModel(
      avatarUrl: "https://www.tipsyelves.com/mas_assets/cache/image/2/d/5/a/450x-11610.Jpg",
      name: "Tyler Baldwin",
      datetime: "11:05",
      message: "I am interested in programming!",
    ),
    ChatModel(
      avatarUrl: "https://a9p9n2x2.stackpathcdn.com/wp-content/blogs.dir/1/files/2015/11/successful-black-woman_Black-Enterprise.jpg",
      name: "Giselle Cole",
      datetime: "09:46",
      message: "I understand",
    )
  ];
}