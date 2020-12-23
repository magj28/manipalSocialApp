import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/UI/widgets/chatCard.dart';
import 'package:manipalsocial/UI/widgets/customTextField.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var channel;
  TextEditingController _chatController;
  @override
  void initState() {
    channel = IOWebSocketChannel.connect('wss://manipal-social.herokuapp.com');
    // channel = IOWebSocketChannel.connect('wss://5c71e184bad9.ngrok.io');
    _chatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff131132),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _chatController,
                  hintMessage: 'Type here...',
                  isPassword: false,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color(0xffFC2E7E),
                  ),
                  onPressed: () {
                    if (_chatController.text.isNotEmpty) {
                      var user =
                          Provider.of<UserViewModel>(context, listen: false)
                              .user;
                      var newMessage = {
                        'type': 'chat',
                        'name': user.name,
                        'email': user.email,
                        'message': _chatController.text,
                        'jwtToken':
                            Provider.of<UserViewModel>(context, listen: false)
                                .jwtToken
                      };
                      String jsonNewMsg = json.encode(newMessage);
                      channel.sink.add(jsonNewMsg);
                      _chatController.text = "";
                    }
                  }),
            ],
          ),
        ),
        backgroundColor: Color(0xff131132),
        appBar: AppBar(
          backgroundColor: Color(0xff131132),
          title: Text(
            'Community Chat',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                var chats = json.decode(snapshot.data);
                var reversedchats = new List.from(chats.reversed);

                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: reversedchats.length,
                  itemBuilder: (context, index) {
                    // return Text(
                    //   reversedchats[index].toString(),
                    //   style: TextStyle(color: Colors.white),
                    // );
                    return ChatCard(
                      mongooseID: reversedchats[index]['_id'],
                      name: reversedchats[index]['name'],
                      email: reversedchats[index]['email'],
                      message: reversedchats[index]['message'],
                      deleteChat: (chatID) {
                        //deleting the chats
                        print('delete chat');
                        print(chatID);
                        var user =
                            Provider.of<UserViewModel>(context, listen: false)
                                .user;
                        var deleteChat = {
                          'type': 'deleteChat',
                          'chatID': chatID,
                          'jwtToken':
                              Provider.of<UserViewModel>(context, listen: false)
                                  .jwtToken
                        };
                        String jsonNewMsg = json.encode(deleteChat);
                        channel.sink.add(jsonNewMsg);
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'No chats to show.',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
