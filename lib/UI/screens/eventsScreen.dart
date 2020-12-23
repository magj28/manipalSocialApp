import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/alertDialog.dart';
import 'package:manipalsocial/UI/widgets/customCard.dart';
import 'package:manipalsocial/UI/widgets/promoCard.dart';
import 'package:manipalsocial/logic/viewModels/eventViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<EventViewModel>(context);
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
              //logic to show a "there are no upcoming events" when the length is 0
              child: event.isFetchingData
                  ? Center(child: CircularProgressIndicator())
                  : (event.upcomingevents.length == 0)
                  ? PromoCard(
                  'assets/images/promoCard.png',
                  'No upcoming events!',
                  'There are no upcoming events in manipal.',
                  "Don't worry we'll keep you updated.", () async {
                String headers = Provider.of<UserViewModel>(context,
                    listen: false)
                    .headers;
                bool success = await Provider.of<EventViewModel>(
                    context,
                    listen: false)
                    .getUpcomingEvents(headers);
                if (success == true) {
                  Navigator.pushNamed(context, '/upcomingEvent');
                } else {
                  showMyDialog(
                      context,
                      'Oops!',
                      'Looks like something went wrong.',
                      Provider.of<EventViewModel>(context,
                          listen: false)
                          .errorMessage);
                }
              },)
                  : ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: event.upcomingevents.length,
                itemBuilder: (context, index) {
                  return PromoCard(
                      'assets/images/promoCard.png',
                      event.upcomingevents[index].name,
                      event.upcomingevents[index].where,
                      event.upcomingevents[index].when,
                          () {
                        event.setSingleUpcomingEvent(
                            event.upcomingevents[index]);
                        Navigator.pushNamed(context, '/upcomingEvent');
                      }
                  //         () async {
                  //   event.setSingleUpcomingEvent(
                  //       event.upcomingevents[index]);
                  //   String headers = Provider.of<UserViewModel>(
                  //       context,
                  //       listen: false)
                  //       .headers;
                  //   bool success = await Provider.of<EventViewModel>(
                  //       context,
                  //       listen: false)
                  //      .getUpcomingEvents(headers);
                  //   if (success == true) {
                  //     Navigator.pushNamed(context, '/upcomingEvent');
                  //   } else {
                  //     showMyDialog(
                  //         context,
                  //         'Oops!',
                  //         'Looks like something went wrong.',
                  //         Provider.of<EventViewModel>(context,
                  //             listen: false)
                  //             .errorMessage);
                  //   }
                  // }
                      );
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
              'Events of Manipal',
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            event.isFetchingData
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: event.events.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        imageurl: null,
                        name: event.events[index].name +
                            '\n By ${event.events[index].organizer}',
                        info: event.events[index].description,
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
