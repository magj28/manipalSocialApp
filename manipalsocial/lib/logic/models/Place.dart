class Place {
  String name;
  String what;
  String where;
  String imageUrl;
  String specialInfo;
  double latitude;
  double longitude;
  Place(
      {this.name,
      this.what,
      this.imageUrl,
      this.where,
      this.specialInfo,
      this.latitude,
      this.longitude});

  Place.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        what = json["what"],
        where = json['where'],
        imageUrl = json['imageUrl'],
        specialInfo = json['specialInfo'],
        latitude = json['coordinates'][0],
        longitude = json['coordinates'][1];
}
