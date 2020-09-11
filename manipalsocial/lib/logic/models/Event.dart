import 'package:flutter/cupertino.dart';

class Event {
  String mongooseId;
  String name;
  String what;
  String organizer;

  Event(
      {@required this.mongooseId,
        @required this.name,
        @required this.what,
        @required this.organizer});

  Event.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        name = json['name'],
        what = json['what'],
        organizer = json['organizer'];


}
