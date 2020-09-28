import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/alertDialog.dart';
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
      width: MediaQuery.of(context).size.width,
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
                  LikeButton(
                    likes: likes,
                    expID: expID,
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

class LikeButton extends StatefulWidget {
  final likes;
  final expID;
  const LikeButton({Key key, this.likes, this.expID}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          splashColor: Colors.pink,
          icon: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : Colors.white,
            size: 35,
          ),
          onPressed: () async {
            String type;
            setState(() {
              if (liked == true) {
                liked = false;
                type = 'unlike';
              } else {
                liked = true;
                type = 'like';
              }
            });
            String headers =
                Provider.of<UserViewModel>(context, listen: false).headers;
            bool success= await Provider.of<ExperienceViewModel>(context, listen: false).updateLikes(headers, widget.expID, type);
            if(!success)
              {
                showMyDialog(
                    context,
                    'Oops!',
                    'Looks like something went wrong.',
                    Provider.of<ExperienceViewModel>(context,
                        listen: false)
                        .errorMessage);
              }
          },
        ),
        Text(
          widget.likes,
          style: TextStyle(
              color: liked ? Colors.red : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ],
    );
  }
}

//Popup menu to edit and delete experiences
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
          bool success= await Provider.of<ExperienceViewModel>(context, listen: false)
              .deleteExperience(headers, widget.expID);
          if(!success)
          {
            showMyDialog(
                context,
                'Oops!',
                'Looks like something went wrong.',
                Provider.of<ExperienceViewModel>(context,
                    listen: false)
                    .errorMessage);
          }
        } else if (result == options.edit) {
          //edit the experience by changing the operation type
          Provider.of<ExperienceViewModel>(context, listen: false)
              .setOperation(Operation.Edit);
          bool success= await Provider.of<ExperienceViewModel>(context, listen: false)
              .setExpID(widget.expID);
          if(success == true){
            Navigator.pushNamed(context, '/addExperience');
          }
          else {
            showMyDialog(
                context,
                'Oops!',
                'Looks like something went wrong.',
                Provider.of<ExperienceViewModel>(context,
                    listen: false)
                    .errorMessage);
          }
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
