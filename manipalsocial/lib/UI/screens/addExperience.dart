import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/customTextField.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';

class AddExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        backgroundColor: Color(0xff131132),
        title: Text(
          'Write Your Experience',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Write Your Experience in Malpe Beach',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff1B90CE),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintMessage: 'Write your experience',
            isPassword: false,
          ),
          SizedBox(
            height: 40,
          ),
          PinkButton(
            buttonText: 'Submit',
            onPress: () {},
          )
        ],
      ),
    );
  }
}
