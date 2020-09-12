import 'package:manipalsocial/logic/models/User.dart';
import 'package:manipalsocial/services/dateTimeConverter.dart';

class Experience {
  String mongooseId;
  String experience;
  User user;
  String placeID;
  String createdAt;
  int likes;

  Experience({
    this.mongooseId,
    this.experience,
    this.user,
    this.placeID,
    this.createdAt,
    this.likes,
  });

  Experience.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        experience = json['experience'],
        user = User.fromJson(json['user_id']),
        placeID = json['place_id'],
        createdAt = dateConvert(json['createdAt']),
        likes = json["likes"];
}
