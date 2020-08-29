import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final String hintMessage;
  final controller;
  final bool isPassword;
  CustomTextField({this.hintMessage, this.controller, this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          margin: EdgeInsets.only(right: 30.0, left: 30.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffFC2E7E),
                // blurRadius: 0,
                offset: Offset(1, 1),
              )
            ],
            color: Color(0xff1E1E3F),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: hintMessage,
            ),
          ),
        ),
      ),
    );
  }
}