import 'package:http/http.dart' as http;
import 'dart:convert';

class WebApi {
  final String url = "https://1ae1f195c38b.ngrok.io/";
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

  Future<dynamic> getPlaces(headers) async {
    final apiUrl = url + 'places/list';
    var response, responseStatus;
    try {
      response = await http.get(apiUrl, headers: {'Authorization': headers});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var placeData = {
        'success': true,
        'clubs': json.decode(response.body)['data']['clubs'],
        'resturants': json.decode(response.body)['data']['resturants'],
        'beaches': json.decode(response.body)['data']['beaches'],
        'message': json.decode(response.body)['message']
      };
      return placeData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  Future<dynamic> getExperiences(headers, placeID) async {
    final apiUrl = url + 'experiences/list/$placeID';
    var response, responseStatus;
    try {
      response = await http.get(apiUrl, headers: {'Authorization': headers});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var expData = {
        'success': true,
        'mostLikedExp': json.decode(response.body)['data']['mostLikedExp'],
        'dateSortedExp': json.decode(response.body)['data']['dateSortedExp'],
        'message': json.decode(response.body)['message']
      };
      return expData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  Future<dynamic> writeExperiences(headers, placeID, experience) async {
    final apiUrl = url + 'experiences/newExp/$placeID';
    var response, responseStatus;
    try {
      response = await http.post(apiUrl, headers: {
        'Authorization': headers
      }, body: {
        'experience': experience,
      });
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var newExpData = {
        'success': true,
        'newExp': json.decode(response.body)['newExp'],
        'message': json.decode(response.body)['message']
      };
      return newExpData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  Future<dynamic> deleteExperiences(headers, expID) async {
    final apiUrl = url + 'experiences/deleteExp/$expID';
    var response, responseStatus;
    try {
      response = await http.delete(apiUrl, headers: {'Authorization': headers});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var deletedExpData = {
        'success': true,
        'message': json.decode(response.body)['message']
      };
      return deletedExpData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }
}
