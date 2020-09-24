import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/services/webApi.dart';

class ChatViewModel with ChangeNotifier {
  //making instace of web api to use their function
  WebApi api = WebApi();

  bool _isFetchingData = false;
  String _errorMessage;

  //getters
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;

  //setters
  setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  Future<bool> deleteChat(headers, chatID) async {
    setFetchingData(true);
    var deletedChat = await api.deleteChat(headers, chatID);
    print(deletedChat);
    if (deletedChat['success'] == true) {
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(deletedChat['message']);
      setFetchingData(false);
      return false;
    }
  }
}
