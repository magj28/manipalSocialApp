import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/infoCard.dart';
import 'package:manipalsocial/logic/models/Event.dart';
import 'package:provider/provider.dart';

class UpcomingEvent extends StatelessWidget {


  Event _event = new Event(
    name: 'Dhol Baje',
    when: '31/08/2020 \n5:30pm',
    where: 'KMC Green',
    imageUrl: 'https://indianstorytime.files.wordpress.com/2012/10/550409_2458318194207_818717898_n.jpg',
    what: 'Annual charitable gala event ‘Dhol Baje’ with a Dandiya night theme',
    organizer: 'Rotaract Club of Manipal',
    contact: {
      'Shubham': '+91 8130180208',
      'Shubh': '+91 81230180208'
    },
  );


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Upcoming Event',
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
              _infoColumn(_event.name, _event.what),
              _infoColumn('Where', _event.where),
              _infoColumn('When', _event.when),
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
              // _event.contact.forEach((key, value) {
              //   InfoCard(key, 'phone', value);
              // }),
              // for(MapEntry<String, String> k in _event.contact.entries){
              //   InfoCard(k.key, 'phone', k.value)
              // },
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
              heading == _event.name
                  ? (_event.name + '\n' + _event.organizer)
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

