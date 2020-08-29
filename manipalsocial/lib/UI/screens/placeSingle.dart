import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/models/Place.dart';
import 'package:manipalsocial/logic/viewModels/placeViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class PlaceSingleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Place place = Provider.of<PlaceViewModel>(context).singlePlace;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Center(
                    child: Image.network(
                      place.imageUrl,
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
              // PinkButton(
              //   buttonText: 'Logout',
              //   onPress: () {
              //     Provider.of<UserViewModel>(context, listen: false).logOut();
              //     Navigator.pushNamedAndRemoveUntil(
              //         context, '/', (route) => false);
              //   },
              // ),
              _infoColumn(place.name, place.what),
              _infoColumn('Where', place.where),
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
