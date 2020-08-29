import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class Place {
  String name;
  String about;
  String location;
  String imageURL;
  String specialInfo;
  Place(
      {this.name, this.about, this.imageURL, this.location, this.specialInfo});
}

Place place = Place(
  name: "Malpe Beach",
  about:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  location:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  specialInfo:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  imageURL:
      "https://www.trawell.in/admin/images/upload/932329381MalpeBeach_Main.jpg",
);

class PlaceSingleScreen extends StatelessWidget {
  // double _width;
  @override
  Widget build(BuildContext context) {
    // _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        title: Center(
          child: Text(
            place.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffFC2E7E), fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xff131132),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Center(
                    child: Image.network(
                      place.imageURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PinkButton(
                    buttonText: 'Experiences',
                    onPress: () {
                      print("register");
                    },
                  ),
                  PinkButton(
                    buttonText: 'Google Map',
                    onPress: () {
                      print("register");
                    },
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Color(0xffFC2E7E),
              ),
              PinkButton(
                buttonText: 'Logout',
                onPress: () {
                  Provider.of<UserViewModel>(context, listen: false).logOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              ),
              _infoColumn(place.name, place.about),
              _infoColumn('Where', place.location),
              _infoColumn('Trivia', place.specialInfo),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _infoColumn(String heading, String description) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heading,
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Text(
              description,
              style: TextStyle(color: Color(0xff9F9FAD), fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
