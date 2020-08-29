import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showMyDialog(context, title, message, subMessage) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xff1E1E3F),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Color(0xffFC2E7E),
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(subMessage,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'OK',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xffFC2E7E),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
