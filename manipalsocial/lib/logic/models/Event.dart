class Event {
  String mongooseId;
  String name;
  String when;
  String where;
  String imageUrl;
  String what;
  String organizer;
  Map<String, String> contact;

  Event({this.mongooseId,
    this.name,
    this.when,
    this.where,
    this.imageUrl,
    this.what,
    this.organizer,
    this.contact
  });

  Event.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        name = json['name'],
        when = json["when"],
        where = json['where'],
        imageUrl = json['imageUrl'],
        what = json['what'],
        organizer = json['organizer'],
        contact= json['contact'];
}