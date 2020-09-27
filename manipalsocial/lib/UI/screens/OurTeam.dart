import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/customCard.dart';

class OurTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff131132),
        appBar: AppBar(
          title: Text(
            'Our Team',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xffFC2E7E)),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xff131132),
        ),
      body: ListView(
        children: [
          CustomCard(
            imageurl: "assets/images/person.png",
            name: "Shubham Pathak",
            info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          ),
          CustomCard(
            imageurl: "assets/images/person.png",
            name: "Shubham Pathak",
            info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          ),
          CustomCard(
            imageurl: "assets/images/person.png",
            name: "Shubham Pathak",
            info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          ),
          CustomCard(
            imageurl: "assets/images/person.png",
            name: "Shubham Pathak",
            info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          ),
        ],
      ),
    );
  }
}
