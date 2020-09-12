import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/infoCard.dart';
import 'package:manipalsocial/logic/models/UpcomingEvent.dart';
import 'package:manipalsocial/logic/viewModels/eventViewModel.dart';
import 'package:provider/provider.dart';

class UpcomingEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ComingEvent _event =
        Provider.of<EventViewModel>(context, listen: false).singleUpcomingEvent;
    return Scaffold(
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        title: Text(
          'Upcoming Event',
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color(0xffFC2E7E), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
                      _event.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Divider(
                thickness: 1,
                color: Color(0xffFC2E7E),
              ),
              _infoColumn(_event.name, _event.what, _event),
              _infoColumn('Where', _event.where, _event),
              _infoColumn('When', _event.when, _event),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Contacts',
                        style: TextStyle(
                            color: Color(0xff1B90CE),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              InfoCard(_event.contacts[0]['contactName'], 'phone',
                  _event.contacts[0]['number']),
              InfoCard(_event.contacts[1]['contactName'], 'phone',
                  _event.contacts[1]['number']),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _infoColumn(String heading, String description, ComingEvent _event) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heading == _event.name
                  ? (_event.name + '\n' + "by " + _event.organizer)
                  : heading,
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
