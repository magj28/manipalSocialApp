import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/homeScreenCard.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/UI/widgets/promoCard.dart';
import 'package:manipalsocial/logic/viewModels/placeViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Color(0xffFC2E7E))),
        centerTitle: true,
        backgroundColor: Color(0xff131132),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PromoCard('assets/images/one.jpg', 'Dhol Baje', 'KMC Green',
                      '5:30 PM', () {}),
                  PromoCard('assets/images/two.jpg', 'Diwali Celeberation',
                      'Hockey Ground', '6:30 PM', () {}),
                  PromoCard('assets/images/one.jpg', 'Unlockathon', 'KMC Green',
                      '8:30 PM', () {}),
                  PromoCard('assets/images/two.jpg', 'Acumen',
                      'Football Ground', '7:30 PM', () {}),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Color(0xffFC2E7E),
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Explore',
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HomeScreenCard('Places to Visit', 'assets/images/places.png',
                    () {
                  String headers =
                      Provider.of<UserViewModel>(context, listen: false)
                          .headers;
                  Provider.of<PlaceViewModel>(context, listen: false)
                      .getPlaces(headers);
                  Navigator.pushNamed(context, '/place');
                }),
                HomeScreenCard('Cab Share', 'assets/images/cab.png', () {
                  Navigator.pushNamed(context, '/cabShare');
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HomeScreenCard('Community Chat', 'assets/images/chat.png', () {
                  Navigator.pushNamed(context, '/chat');
                }),
                HomeScreenCard(
                    'Events of Manipal', 'assets/images/places.png', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HomeScreenCard('Profile', 'assets/images/chat.png', () {
                  Navigator.pushNamed(context, '/profile');
                }),
                HomeScreenCard('Logout', 'assets/images/places.png', () {
                  Provider.of<UserViewModel>(context, listen: false).logOut();
                }),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 1,
              color: Color(0xffFC2E7E),
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Reach out to us.',
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Want to publicize your event or club?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            PinkButton(
              buttonText: 'Contact Us',
              onPress: () {},
            ),
            PinkButton(
              buttonText: ' Out Team ',
              onPress: () {},
            ),
            PinkButton(
              buttonText: ' About Us ',
              onPress: () {},
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
