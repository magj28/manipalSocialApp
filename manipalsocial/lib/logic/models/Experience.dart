class Experience {
  String mongooseId;
  String experience;
  String userID;
  String placeID;
  String createdAt;
  int likes;

  Experience({this.mongooseId,
    this.experience,
    this.userID,
    this.placeID,
    this.createdAt,
    this.likes,
  });

  Experience.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        experience = json['experience'],
        userID = json['userID'],
        placeID = json['placeID'],
        createdAt = json['createdAt'],
        likes = json["likes"];

}