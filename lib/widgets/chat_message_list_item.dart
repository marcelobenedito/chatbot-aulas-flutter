import 'package:chatbot/models/chat_message.dart';
import 'package:clippy_flutter/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  static const double messageBoxWidth = 200.0;
  static const double messageBoxHeight = 100.0;

  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0, left: 64.0, bottom: 8.5, top: 8.5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0, // has the effect of softening the shadow
                spreadRadius: -4.0, // has the effect of extending the shadow
                offset: Offset(
                  4.0, // horizontal, move right 10
                  4.0, // vertical, move down 10
                ),
              ),
            ]),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          trailing:
              CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
          title: Text(chatMessage.name, textAlign: TextAlign.right),
          subtitle: Text(chatMessage.text, textAlign: TextAlign.right),
          leading: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  chatMessage.time,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showReceivedMessage() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 64.0, top: 8.5, bottom: 8.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0, // has the effect of softening the shadow
                spreadRadius: -4.0, // has the effect of extending the shadow
                offset: Offset(
                  4.0, // horizontal, move right 10
                  4.0, // vertical, move down 10
                ),
              )
            ],
          ),
          child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              leading:
                  CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
              title: Text(chatMessage.name, textAlign: TextAlign.left),
              subtitle: Text(chatMessage.text, textAlign: TextAlign.left),
              trailing: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      chatMessage.time,
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              )),
        ));
  }
}
