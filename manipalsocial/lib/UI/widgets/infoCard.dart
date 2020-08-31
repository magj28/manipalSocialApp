import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InfoCard extends StatelessWidget {
  final String heading;
  final String description;
  final String type;
  IconData iconSelector() {
    if (type == "email")
      return Icons.email;
    else if (type == "phone")
      return Icons.phone;
    else
      return Icons.add_comment;
  }

  InfoCard(this.heading, this.type, this.description);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          margin: EdgeInsets.all(3.0),
          padding: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Color(0xff1D1D3E),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                iconSelector(),
                size: 27.0,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                      color: Color(0xff1B90CE),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
