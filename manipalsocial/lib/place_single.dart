import 'package:flutter/material.dart';

class PlaceSingle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: AppBar(
        title: Center(
          child: Text(
            'Malpe Beach',
            textAlign: TextAlign.center,
            //style: TextStyle(),
          ),
        ),
        backgroundColor: Colors.purple[900],
      ),
      body: Container(

        child: Column(
          children: <Widget>[
            Center(
              //padding: EdgeInsets.all(20.0),
              child: Image.network(
                'https://www.trawell.in/admin/images/upload/932329381MalpeBeach_Main.jpg',
                fit: BoxFit.contain,
                //height: 130,
                //width: 130,
              ),
            ),
            Padding(
              padding:EdgeInsets.only(bottom: 10.0) ,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    color: Colors.pink,
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
                    color: Colors.pink,
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
          ],
        ),
      ),
    );
  }
}
