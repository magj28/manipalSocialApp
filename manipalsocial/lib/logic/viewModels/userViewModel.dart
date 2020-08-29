import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/logic/models/User.dart';
import 'package:manipalsocial/services/storageService.dart';
import 'package:manipalsocial/services/webApi.dart';

enum Status { Uninitialized, Authenticated, Unauthenticated }

class UserViewModel with ChangeNotifier {
  //making instace of web api and storage services to use their function
  WebApi api = WebApi();
  StorageService storage = StorageService();

  Status _status = Status.Uninitialized;
  User _user;
  String _jwtToken;
  String _headers;
  bool _isFetchingData = false;
  String _errorMessage;

  //getters
  User get user => _user;
  Status get status => _status;
  String get jwtToken => _jwtToken;
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;
  String get headers => _headers;

  UserViewModel.initialize() {
    checkLogIn();
  }

  //setters
  setJwtToken(value) {
    _jwtToken = value;
    _headers = "Bearer $_jwtToken";
    notifyListeners();
  }

  setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  setStatus(value) {
    _status = value;
    notifyListeners();
  }

  setUser(value) {
    _user = User.fromJson(value);
    notifyListeners();
  }

  Future<void> checkLogIn() async {
    final jwtTokenAndUser = await storage.getJwtTokenAndUser();
    if (jwtTokenAndUser['token'] == null) {
      print("jwt token not found");
      setStatus(Status.Unauthenticated);
    } else {
      print("user already authenticated");
      setJwtToken(jwtTokenAndUser['token']);

      var user = {
        'name': jwtTokenAndUser['name'],
        'email': jwtTokenAndUser['email'],
        'phoneNumber': jwtTokenAndUser['phoneNumber']
      };
      setUser(user);
      setStatus(Status.Authenticated);
    }
  }

  Future<bool> signUp(name, email, phNumber, password) async {
    setFetchingData(true);
    var userData = await api.registerUser(name, email, phNumber, password);
    if (userData['success'] == true) {
      storage.storeJwtTokenAndUser(userData['token'], userData['user']);
      setJwtToken(userData['token']);
      setUser(userData['user']);
      setStatus(Status.Authenticated);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(userData['message']);
      setFetchingData(false);
      return false;
    }
  }

  Future<bool> login(email, password) async {
    setFetchingData(true);
    var userData = await api.loginUser(email, password);
    if (userData['success'] == true) {
      storage.storeJwtTokenAndUser(userData['token'], userData['user']);
      setJwtToken(userData['token']);
      setUser(userData['user']);
      setStatus(Status.Authenticated);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(userData['message']);
      setFetchingData(false);
      return false;
    }
  }

  Future<void> logOut() async {
    setStatus(Status.Unauthenticated);
    storage.deleteAllData();
  }
}
