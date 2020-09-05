import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/UI/widgets/infoCard.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/models/User.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserViewModel>(context).user;
    return Scaffold(
      backgroundColor: const Color(0xff131132),
      appBar: AppBar(
        elevation: 10.0,
        title: Center(
            child: Text(
          'YOUR PROFILE',
          style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 28.0,
              color: Color(0xffFC2E7E)),
        )),
        centerTitle: true,
        backgroundColor: const Color(0xff1D1D3E),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 30,
                    color: Color(0xff20B5FD),
                    blurRadius: 100,
                    offset: Offset(0, 0),
                  )
                ],
                color: Color(0xff20B5FD),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: CircleAvatar(
                radius: 52,
                backgroundColor: Color(0xffFC2E7E),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://istemanipal.com/media/DPs/Shubham_Pathak.jpeg'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              user.name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            PinkButton(
              buttonText: 'Change photo',
              onPress: () {},
            ),
            SizedBox(
              height: 20.0,
            ),
            InfoCard(user.email, 'email', ''),
            InfoCard('+91 ${user.phoneNumber}', 'phone', ''),
            SizedBox(
              height: 30.0,
            ),
            PinkButton(
              buttonText: 'Edit Information',
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
