import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key key,
    @required this.name,
    @required this.email,
    @required this.date,
    @required this.likes,
    @required this.experience,
  }) : super(key: key);

  final String name;
  final String email;
  final String date;
  final String likes;
  final String experience;

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
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
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
