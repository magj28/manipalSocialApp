import 'package:http/http.dart' as http;
import 'dart:convert';

class WebApi {
  final String url = "https://51cb7f218bc5.ngrok.io/";
  var networkError = {
    'success': false,
    'error': "Network Error.",
    'message':
        "Some kind of network error occurred. Cannot send requests. Check your network and if the problem persists then probably the server isn't responding."
  };

  //for registering users
  Future<dynamic> registerUser(name, email, phNumber, password) async {
    final apiUrl = url + 'user/register';
    var response, responseStatus;
    try {
      response = await http.post(apiUrl, body: {
        'name': name,
        'email': email,
        'phoneNumber': phNumber,
        'password': password
      });
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      return networkError;
    }

    if (response.statusCode == 200 && responseStatus == "success") {
      var userData = {
        'success': true,
        'user': json.decode(response.body)['data'],
        'token': json.decode(response.body)['token'],
        'message': json.decode(response.body)['message']
      };
      return userData;
    } else {
      print(response.body);
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  //for login user
  Future<dynamic> loginUser(email, password) async {
    final apiUrl = url + 'user/login';
    var response, responseStatus;
    try {
      response = await http.post(apiUrl, body: {
        'email': email,
        'password': password,
      });
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var userData = {
        'success': true,
        'user': json.decode(response.body)['data'],
        'token': json.decode(response.body)['token'],
        'message': json.decode(response.body)['message']
      };
      return userData;
    } else {
      print(response.body);
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }
}
