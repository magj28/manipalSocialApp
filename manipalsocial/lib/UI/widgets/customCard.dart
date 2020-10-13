import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomCard extends StatelessWidget {
  final String imageurl, name, info;
  final Function onTap;

  CustomCard({this.imageurl, this.info, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
        child: Container(
            margin: EdgeInsets.all(3.0),
            padding: EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff1D1D3E),
            ),
            child: Row(
              children: <Widget>[
                (imageurl == null)
                    ? Container()
                    : CircleAvatar(
                        backgroundImage: AssetImage(imageurl),
                        radius: 40.0,
                      ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Color(0xff1B90CE),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Text(
                        info,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      )),
    );
  }
}
