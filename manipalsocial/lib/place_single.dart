import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double _width;

class PlaceSingle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _width:
    MediaQuery.of(context).size.width;
    return _singlePlaceScreen(
        'Malpe Beach',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        'https://www.trawell.in/admin/images/upload/932329381MalpeBeach_Main.jpg');
  }
}

_singlePlaceScreen(String name, String about, String location, String splInfo,
    String imageurl) {
  return Scaffold(
    backgroundColor: Color(0xff131132),
    appBar: AppBar(
      title: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff1B90CE)),
        ),
      ),
      backgroundColor: Color(0xff131132),
    ),
    body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Center(
                  child: Image.network(
                    imageurl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    color: Color(0xffFC2E7E),
                    textColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                    onPressed: () {},
                    child: Text(
                      'Experiences',
                      style: TextStyle(fontSize: 20.0),
                    )),
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    color: Color(0xffFC2E7E),
                    textColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                    onPressed: () {},
                    child: Text(
                      'Google Map',
                      style: TextStyle(fontSize: 20.0),
                    ))
              ],
            ),
            Divider(
              height: 10,
              thickness: 10,
              //color: Colors.white,
            ),
            _infoColumn('ABOUT', about),
            _infoColumn('WHERE', location),
            _infoColumn('SPECIAL INFORMATION', splInfo),
      Padding(
            padding: EdgeInsets.all(10.0),
          ),
          ],
        ),
      ),
    ),
  );
}

_infoColumn(String text1, String text2) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Text(
              text1,
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Text(
            text2,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
//          Padding(
//            padding: EdgeInsets.all(10.0),
//          ),
        ],
      ),
    ),
  );
}
