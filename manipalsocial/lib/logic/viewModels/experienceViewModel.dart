import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/logic/models/Experience.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:manipalsocial/services/webApi.dart';

class ExperienceViewModel with ChangeNotifier {
  //making instance of web api to use their function
  WebApi api = WebApi();
  UserViewModel user = UserViewModel();

  List<Experience> _mostLikedExp = List<Experience>();
  List<Experience> _dateSortedExp = List<Experience>();
  bool _isFetchingData = false;
  String _errorMessage;

  //getters
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;
  List<Experience> get mostLikedExp=> _mostLikedExp;
  List<Experience> get dateSortedExp=> _dateSortedExp;

  //setters
  setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }


  setExperiences(value) {
    //clearing the previously filled data so that data doesn't get repeated
    _mostLikedExp.clear();
    _dateSortedExp.clear();

    //initializing arrays of places
    var mostLikedExp = value['mostLikedExp'];
    var dateSortedExp = value['dateSortedExp'];

    //adding in list of experience objects
    for (int i = 0; i < mostLikedExp.length; i++) {
      _mostLikedExp.add(Experience.fromJson(mostLikedExp[i]));
    }

    for (int i = 0; i < dateSortedExp.length; i++) {
      _dateSortedExp.add(Experience.fromJson(dateSortedExp[i]));
    }
    notifyListeners();
  }

  Future<bool> getExperiences(headers, placeID ) async {
    setFetchingData(true);
    var experiences = await api.getExperiences(headers, placeID);
    if (experiences['success'] == true) {
      setExperiences(experiences);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(experiences['message']);
      setFetchingData(false);
      return false;
    }
  }
}
