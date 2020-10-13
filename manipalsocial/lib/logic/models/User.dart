class User {
  String mongooseID;
  String name;
  String email;
  String phoneNumber;
  User(this.name, this.email, this.phoneNumber);

  User.fromJson(Map<dynamic, dynamic> json)
      : email = json['email'],
        name = json["name"],
        phoneNumber = json['phoneNumber'],
        mongooseID = json['_id'];
}
