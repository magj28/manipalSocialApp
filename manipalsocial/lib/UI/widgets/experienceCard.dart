import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/logic/viewModels/experienceViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard(
      {Key key,
      @required this.name,
      @required this.email,
      @required this.date,
      @required this.likes,
      @required this.experience,
      @required this.expID})
      : super(key: key);

  final String name;
  final String email;
  final String date;
  final String likes;
  final String experience;
  final String expID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff1D1D3E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://istemanipal.com/media/DPs/Shubham_Pathak.jpeg'),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(name,
                      style: TextStyle(
                          color: Color(0xff1B90CE),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  Text(email,
                      softWrap: true,
                      style: TextStyle(
                          color: Color(0xffFC2E7E),
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                  Text(date,
                      style: TextStyle(
                          color: Color(0xffFC2E7E),
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Show the 3 dots menu only for those experiences which are written by the user himself
                  //by comparing the user's email with the experience email.
                  (Provider.of<UserViewModel>(context, listen: false)
                              .user
                              .email !=
                          email)
                      ? Container()
                      : PopUpMenu(expID),
                  IconButton(
                    splashColor: Colors.amber,
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    likes,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              experience,
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

enum options { delete, edit }

class PopUpMenu extends StatefulWidget {
  final expID;
  PopUpMenu(this.expID);
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
          Provider.of<ExperienceViewModel>(context, listen: false)
              .deleteExperience(headers, widget.expID);
        } else if (result == options.edit) {
          //edit the experience by changing the operation type
          Provider.of<ExperienceViewModel>(context, listen: false)
              .setOperation(Operation.Edit);
          Navigator.pushNamed(context, '/addExperience');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<options>>[
        const PopupMenuItem<options>(
          value: options.edit,
          child: Text(
            'Edit post',
            style: TextStyle(color: Color(0xff1B90CE)),
          ),
        ),
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
