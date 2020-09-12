import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/homeScreenCard.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/UI/widgets/promoCard.dart';
import 'package:manipalsocial/logic/viewModels/eventViewModel.dart';
import 'package:manipalsocial/logic/viewModels/placeViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //View models objects using provider
    final event = Provider.of<EventViewModel>(context, listen: false);

    return Scaffold(
      drawer: DrawerScreen(),
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
              child: event.isFetchingData
                  ? Center(child: CircularProgressIndicator())
                  : (event.upcomingevents.length == 0)
                      ? PromoCard(
                          'assets/images/promoCard.png',
                          'No upcoming events!',
                          'There are no upcoming events in manipal.',
                          "Don't worry we'll keep you updated.",
                          () {})
                      : ListView.builder(
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: event.upcomingevents.length,
                          itemBuilder: (context, index) {
                            return PromoCard(
                                'assets/images/promoCard.png',
                                event.upcomingevents[index].name,
                                event.upcomingevents[index].where,
                                event.upcomingevents[index].when, () {
                              event.setSingleUpcomingEvent(
                                  event.upcomingevents[index]);
                              Navigator.pushNamed(context, '/upcomingEvent');
                            });
                          },
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
                HomeScreenCard('Events of Manipal', 'assets/images/event.png',
                    () {
                  String headers =
                      Provider.of<UserViewModel>(context, listen: false)
                          .headers;
                  Provider.of<EventViewModel>(context, listen: false)
                      .getEvents(headers);
                  Provider.of<EventViewModel>(context, listen: false)
                      .getUpcomingEvents(headers);
                  Navigator.pushNamed(context, '/event');
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
              buttonText: ' Our Team ',
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

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 10,
                          color: Color(0xff20B5FD),
                          blurRadius: 20,
                          offset: Offset(0, 0),
                        )
                      ],
                      color: Color(0xff20B5FD),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://istemanipal.com/media/DPs/Shubham_Pathak.jpeg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xffFC2E7E),
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Provider.of<UserViewModel>(context, listen: false).logOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/signUp', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
