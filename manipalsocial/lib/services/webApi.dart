import 'package:http/http.dart' as http;
import 'dart:convert';

class WebApi {
  final String url = "https://manipal-social.herokuapp.com/";
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

  Future<dynamic> editExperiences(headers, expID, experience) async {
    final apiUrl = url + 'experiences/editExp/$expID';
    var response, responseStatus;
    try {
      response = await http.patch(apiUrl, headers: {
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
      var updatedExpData = {
        'success': true,
        'newExp': json.decode(response.body)['updatedExp'],
        'message': json.decode(response.body)['message']
      };
      return updatedExpData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  Future<dynamic> updateLikesExperiences(headers, expID, type) async {
    final apiUrl = url + 'experiences/updateLikes/$expID?type=$type';
    var response, responseStatus;
    try {
      response = await http.patch(apiUrl, headers: {'Authorization': headers});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      print(response.body);
      var updatedExpData = {
        'success': true,
        'message': json.decode(response.body)['message']
      };
      return updatedExpData;
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

  Future<dynamic> deleteChat(headers, chatID) async {
    final apiUrl = url + 'chats/deleteChat/$chatID';
    var response, responseStatus;
    try {
      response = await http.delete(apiUrl, headers: {'Authorization': headers});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var deletedChatData = {
        'success': true,
        'message': json.decode(response.body)['message']
      };
      return deletedChatData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  Future<dynamic> getEvents(headers) async {
    final apiUrl = url + 'event/list';
    var response, responseStatus;
    try {
      response = await http.get(apiUrl, headers: {'Authorization': headers});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var eventData = {
        'success': true,
        'events': json.decode(response.body)['data']['events'],
        'message': json.decode(response.body)['message']
      };
      return eventData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  Future<dynamic> getUpcomingEvents(headers) async {
    final apiUrl = url + 'event/upcomingEvents';
    var response, responseStatus;
    try {
      response = await http.get(apiUrl, headers: {'Authorization': headers});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var upcomingEventData = {
        'success': true,
        'upcomingEvents': json.decode(response.body)['data']['upcomingEvents'],
        'message': json.decode(response.body)['message']
      };
      return upcomingEventData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['error'],
        'message': json.decode(response.body)['message']
      };
      return error;
    }
  }

  Future<dynamic> getCabShares(headers, to, from, dateTime) async {
    final apiUrl = url + 'cabs/getCabShares';
    var response, responseStatus;
    try {
      response = await http.post(apiUrl,
          headers: {'Authorization': headers},
          body: {'to': to, 'from': from, 'dateTime': dateTime});
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      print(e);
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "success") {
      var expData = {
        'success': true,
        'cabShareList': json.decode(response.body)['data']['cabShareList'],
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
}
