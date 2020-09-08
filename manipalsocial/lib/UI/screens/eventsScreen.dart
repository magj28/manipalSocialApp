import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/customCard.dart';
import 'package:manipalsocial/UI/widgets/promoCard.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        title: Text('Events of Manipal',
            style: TextStyle(color: Color(0xffFC2E7E))),
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
                      '5:30 PM', () {
                    Navigator.pushNamed(context, '/upcomingEvent');
                  }),
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
              'Events of Manipal',
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return CustomCard(
                  imageurl: "assets/images/beachLogo.png",
                  name: "Unlockathon",
                  info: "Its an online event in TechTactaorganized by ISTE.",
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
