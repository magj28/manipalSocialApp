import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/alertDialog.dart';
import 'package:manipalsocial/logic/viewModels/chatViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
    @required this.mongooseID,
    @required this.name,
    @required this.email,
    @required this.message,
  }) : super(key: key);

  final String name;
  final String email;
  final String message;
  final String mongooseID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: (Provider.of<UserViewModel>(context, listen: false).user.email !=
                email)
            ? Color(0xff1D1D3E)
            : Color(0xff232C4D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  : PopUpMenu(mongooseID),
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

//Popup menu to edit and delete experiences
enum options { delete, edit }

class PopUpMenu extends StatefulWidget {
  final chatID;
  PopUpMenu(this.chatID);
  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  options selection = options.edit;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<options>(
      color: Color(0xff1D1D3E),
      onSelected: (options result) async {
        setState(() {
          selection = result;
        });
        if (result == options.delete) {
          //delete the experience
          String headers =
              Provider.of<UserViewModel>(context, listen: false).headers;
          bool success =
              await Provider.of<ChatViewModel>(context, listen: false)
                  .deleteChat(headers, widget.chatID);
          if (!success) {
            showMyDialog(
                context,
                "Error",
                "Some network error occured. Could not make request.",
                Provider.of<ChatViewModel>(context, listen: false)
                    .errorMessage);
          }
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<options>>[
        const PopupMenuItem<options>(
          value: options.delete,
          child: Text(
            'Delete post',
            style: TextStyle(color: Color(0xff1B90CE)),
          ),
        ),
      ],
    );
  }
}
