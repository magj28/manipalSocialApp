import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final storage = new FlutterSecureStorage();
  Future<void> storeJwtTokenAndUser(token, user) async {
    await storage.write(key: "token", value: token);
    await storage.write(key: "name", value: user['name']);
    await storage.write(key: "email", value: user['email']);
    await storage.write(key: "phoneNumber", value: user['phoneNumber']);
  }

  Future<dynamic> getJwtTokenAndUser() async {
    Map<String, String> jwtTokenAndUser = await storage.readAll();
    print(jwtTokenAndUser);
    return jwtTokenAndUser;
  }

  Future<void> deleteAllData() async {
    await storage.deleteAll();
  }
}
