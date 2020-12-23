import 'package:flutter/cupertino.dart';

class Event {
  String mongooseId;
  String name;
  String description;
  String organizer;

  Event(
      {@required this.mongooseId,
      @required this.name,
      @required this.description,
      @required this.organizer});

  Event.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        name = json['name'],
        description = json['description'],
        organizer = json['organizer'];
}
