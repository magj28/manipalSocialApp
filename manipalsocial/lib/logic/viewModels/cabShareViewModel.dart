import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/logic/models/CabShare.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:manipalsocial/services/webApi.dart';

class CabViewModel with ChangeNotifier {
  //making instance of web api to use their function
  WebApi api = WebApi();
  UserViewModel user = UserViewModel();

  List<CabShare> _cabShareList = List<CabShare>();
  bool _isFetchingData = false;
  String _errorMessage;

  //getters
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;
  List<CabShare> get cabShareList => _cabShareList;

  //setters
  setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  setCabShares(value) {
    //clearing the previously filled data so that data doesn't get repeated
    _cabShareList.clear();

    //initializing arrays of events
    var cabShareList = value['cabShareList'];

    //adding in list of places objects
    for (int i = 0; i < cabShareList.length; i++) {
      _cabShareList.add(CabShare.fromJson(cabShareList[i]));
    }

    notifyListeners();
  }

  Future<bool> getCabShares(headers, to, from, dateTime) async {
    setFetchingData(true);
    var cabShareList = await api.getCabShares(headers, to, from, dateTime);
    if (cabShareList['success'] == true) {
      setCabShares(cabShareList);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(cabShareList['message']);
      setFetchingData(false);
      return false;
    }
  }
}
