import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  PinkButton({this.buttonText, this.onPress});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Color(0xffFE74A4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      color: Color(0xffFC2E7E),
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
      onPressed: onPress,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}
