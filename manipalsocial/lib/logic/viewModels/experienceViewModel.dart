import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/logic/models/Experience.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:manipalsocial/services/webApi.dart';

enum Operation { Edit, Create }

class ExperienceViewModel with ChangeNotifier {
  //making instance of web api to use their function
  WebApi api = WebApi();
  UserViewModel user = UserViewModel();

  List<Experience> _mostLikedExp = List<Experience>();
  List<Experience> _dateSortedExp = List<Experience>();
  bool _isFetchingData = false;
  String _errorMessage;
  Operation _operation = Operation.Create;
  String _expID; //for editing a particular expid needs to be sent

  //getters
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;
  List<Experience> get mostLikedExp => _mostLikedExp;
  List<Experience> get dateSortedExp => _dateSortedExp;
  Operation get operation => _operation;
  String get expID => _expID;

  //setters
  setOperation(value) {
    _operation = value;
    notifyListeners();
  }

  setExpID(value) {
    _expID = value;
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

    setFetchingData(false);

    notifyListeners();
  }

  setNewExperiences(value) {
    _dateSortedExp.insert(0, Experience.fromJson(value['newExp']));
    notifyListeners();
  }

  setUpdateLikes(expID, type) {
    final indexOfExp =
        _dateSortedExp.indexWhere((element) => element.mongooseId == expID);
    final indexOfLikedExp =
        _mostLikedExp.indexWhere((element) => element.mongooseId == expID);
    if (type == "like") {
      _dateSortedExp[indexOfExp].likes++;
      _mostLikedExp[indexOfLikedExp].likes++;
      print(_dateSortedExp[indexOfExp].likes);
    } else {
      _dateSortedExp[indexOfExp].likes--;
      _mostLikedExp[indexOfLikedExp].likes--;
      print(_dateSortedExp[indexOfExp].likes);
    }
    notifyListeners();
  }

  setDeletedExp(value) {
    _mostLikedExp.removeWhere((element) {
      return element.mongooseId == value;
    });
    _dateSortedExp.removeWhere((element) {
      return element.mongooseId == value;
    });
    notifyListeners();
  }

  Future<bool> getExperiences(headers, placeID) async {
    print(placeID);
    setFetchingData(true);
    var experiences = await api.getExperiences(headers, placeID);
    print(experiences);
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

  Future<bool> updateLikes(headers, expID, type) async {
    print(expID);
    setUpdateLikes(expID, type);
    var updateLikes = await api.updateLikesExperiences(headers, expID, type);
    print(updateLikes);
    if (updateLikes['success'] == true) {
      return true;
    } else {
      setErrorMessage(updateLikes['message']);
      //if some error occured we need to revert back the changes we made
      if (type == 'like') {
        setUpdateLikes(expID, 'unlike');
      } else {
        setUpdateLikes(expID, 'like');
      }
      return false;
    }
  }

  Future<bool> createExperience(headers, placeID, experience) async {
    setFetchingData(true);
    var newExp = await api.writeExperiences(headers, placeID, experience);
    print(newExp);
    if (newExp['success'] == true) {
      setNewExperiences(newExp);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(newExp['message']);
      setFetchingData(false);
      return false;
    }
  }

  Future<bool> editExperience(headers, expID, placeID, experience) async {
    setFetchingData(true);
    var updatedExp = await api.editExperiences(headers, expID, experience);
    print(updatedExp);
    if (updatedExp['success'] == true) {
      //once the updated experience is there we need to refresh the list
      //so calling getexperiences again
      getExperiences(headers, placeID);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(updatedExp['message']);
      setFetchingData(false);
      return false;
    }
  }

  Future<bool> deleteExperience(headers, expID) async {
    setFetchingData(true);
    var deletedExp = await api.deleteExperiences(headers, expID);
    print(deletedExp);
    if (deletedExp['success'] == true) {
      setDeletedExp(expID);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(deletedExp['message']);
      setFetchingData(false);
      return false;
    }
  }
}
