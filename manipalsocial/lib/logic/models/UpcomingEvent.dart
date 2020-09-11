import 'package:flutter/cupertino.dart';

class ComingEvent {
  String mongooseId;
  String name;
  String when;
  String where;
  String imageUrl;
  String what;
  String organizer;
  List<Map<String, String>> contact;

  ComingEvent(
      {@required this.mongooseId,
        @required this.name,
        @required this.when,
        @required this.where,
        @required this.imageUrl,
        @required this.what,
        @required this.organizer,
        @required this.contact});

  ComingEvent.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        name = json['name'],
        when = json["when"],
        where = json['where'],
        imageUrl = json['imageUrl'],
        what = json['what'],
        organizer = json['organizer'],
        contact = json['contact'];
}
