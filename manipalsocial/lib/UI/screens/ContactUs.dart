import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff131132),
        appBar: AppBar(
          title: Text(
            'Contact Us',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xffFC2E7E)),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xff131132),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                        width: MediaQuery.of(context).size.width / 2.5,
                        image: AssetImage("assets/images/istelogo.jpg"),
                        fit: BoxFit.cover),
                  ),
                  Text("About",
                      style: TextStyle(
                          color: Color(0xff1B90CE),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Text(
                      "ISTE Manipal is a student chapter under Indian Society For Technical Education. This multidomain club organises workshops and events for tech aficionados.",
                      style: TextStyle(
                        color: Color(0xff1B90CE),
                        fontSize: 15.0,
                      )),
                  Text("Contact Us",
                      style: TextStyle(
                          color: Color(0xff1B90CE),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: Color(0xff1B90CE),
                        ),
                      ),
                      Text("contactus@istemanipal.com",
                          style: TextStyle(
                            color: Color(0xff1B90CE),
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.call,
                          size: 20,
                          color: Color(0xff1B90CE),
                        ),
                      ),
                      Text("8130180208",
                          style: TextStyle(
                            color: Color(0xff1B90CE),
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
