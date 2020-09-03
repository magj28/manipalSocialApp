import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/UI/widgets/chatCard.dart';
import 'package:manipalsocial/UI/widgets/customTextField.dart';

class ChatScreen extends StatelessWidget {
  var names = [
    'Shubham Pathak',
    'Sarath Chandra Reddy',
    'Almas Ahsruf Khan',
    'Sarthak Nitin Khandelwal'
  ];
  var email = [
    'smartshubhampathak@gmail.com',
    'almasAshurfkhan@gmail.com',
    'asdsdanfbksadbf@gmail.com',
    'asfd@gmail.com'
  ];
  var likes = ['300', '350', '400', '450'];
  var date = ['6/8/2020', '7/8/2020', '8/8/2020', '9/8/2020'];
  String experience =
      'One of the most happening beach in the region. Located around 8 km from udupi.\nBest time to visit is Nov-Feb,otherwise its going to be really hot out there. One of the most happening beach in the region. Located around 8 km from udupi.\nBest time to visit is Nov-Feb,otherwise its going to be really hot out there. One of the most happening beach in the region. Located around 8 km from udupi.\nBest time to visit is Nov-Feb,otherwise its going to be really hot out there. One of the most happening beach in the region. Located around 8 km from udupi.\nBest time to visit is Nov-Feb,otherwise its going to be really hot out there';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomTextField(
              hintMessage: 'Type here...',
              isPassword: false,
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.send,
                color: Color(0xffFC2E7E),
              ),
              onPressed: () {}),
        ],
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
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return ChatCard(
              name: names[index],
              email: email[index],
              date: date[index],
              likes: likes[index],
              experience: experience);
        },
      ),
    );
  }
}
