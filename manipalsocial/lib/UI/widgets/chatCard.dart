import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class ChatCard extends StatelessWidget {
  const ChatCard(
      {Key key,
      @required this.mongooseID,
      @required this.name,
      @required this.email,
      @required this.message,
      this.deleteChat})
      : super(key: key);

  final String name;
  final String email;
  final String message;
  final String mongooseID;
  final Function deleteChat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: (Provider.of<UserViewModel>(context, listen: false).user.email !=
                email)
            ? Color(0xff1D1D3E)
            : Color(0xff232C4D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(name,
                        style: TextStyle(
                            color: Color(0xff1B90CE),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    Text(email,
                        softWrap: true,
                        style: TextStyle(
                            color: Color(0xffFC2E7E),
                            fontWeight: FontWeight.bold,
                            fontSize: 11)),
                  ],
                ),
              ),

              // Text(date,
              //     style: TextStyle(
              //         color: Color(0xffFC2E7E),
              //         fontWeight: FontWeight.bold,
              //         fontSize: 13)),
              //Show the 3 dots menu only for those experiences which are written by the user himself
              //by comparing the user's email with the experience email.
              (Provider.of<UserViewModel>(context, listen: false).user.email !=
                      email)
                  ? Container()
                  : PopUpMenu(mongooseID, deleteChat),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 10),
            child: Text(
              message,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}

//Popup menu to edit and delete chats
enum options { delete }

class PopUpMenu extends StatefulWidget {
  final chatID;
  final Function deleteChat;
  PopUpMenu(this.chatID, this.deleteChat);
  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  options selection = options.delete;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<options>(
      color: Color(0xff1D1D3E),
      onSelected: (options result) async {
        setState(() {
          selection = result;
        });
        if (result == options.delete) {
          widget.deleteChat(widget.chatID);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<options>>[
        const PopupMenuItem<options>(
          value: options.delete,
          child: Text(
            'Delete chat',
            style: TextStyle(color: Color(0xff1B90CE)),
          ),
        ),
      ],
    );
  }
}
