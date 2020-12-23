class Place {
  String mongooseId;
  String name;
  String what;
  String where;
  String imageUrl;
  String specialInfo;
  double latitude;
  double longitude;
  Place(
      {this.mongooseId,
      this.name,
      this.what,
      this.imageUrl,
      this.where,
      this.specialInfo,
      this.latitude,
      this.longitude});

  Place.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        name = json['name'],
        what = json["what"],
        where = json['where'],
        imageUrl = json['imageUrl'],
        specialInfo = json['specialInfo'],
        latitude = double.parse(json['coordinates'][0]),
        longitude = double.parse(json['coordinates'][1]);
}
