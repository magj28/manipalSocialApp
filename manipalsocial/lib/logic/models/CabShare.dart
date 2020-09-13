import 'package:manipalsocial/logic/models/User.dart';
import 'package:manipalsocial/services/dateTimeConverter.dart';

class CabShare {
  String mongooseId;
  String to;
  String from;
  User user;
  String dateTime;

  CabShare({
    this.mongooseId,
    this.to,
    this.from,
    this.user,
    this.dateTime,
  });

  CabShare.fromJson(Map<dynamic, dynamic> json)
      : mongooseId = json['_id'],
        to = json['to'],
        from = json['from'],
        user = User.fromJson(json['user_id']),
        dateTime = dateConvert(json['dateTime']);
}
