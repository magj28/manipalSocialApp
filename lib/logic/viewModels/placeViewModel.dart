import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/logic/models/Place.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:manipalsocial/services/webApi.dart';

class PlaceViewModel with ChangeNotifier {
  //making instace of web api to use their function
  WebApi api = WebApi();
  UserViewModel user = UserViewModel();

  List<Place> _clubs = List<Place>();
  List<Place> _resturants = List<Place>();
  List<Place> _beaches = List<Place>();
  bool _isFetchingData = false;
  String _errorMessage;
  Place _singlePlace;

  //getters
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;
  List<Place> get clubs => _clubs;
  List<Place> get resturants => _resturants;
  List<Place> get beaches => _beaches;
  Place get singlePlace => _singlePlace;

  //setters
  setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  setSinglePlace(value) {
    _singlePlace = value;
    notifyListeners();
  }

  setPlaces(value) {
    //clearing the previously filled data so that data doesn't get repeated
    _clubs.clear();
    _beaches.clear();
    _resturants.clear();

    //initializing arrays of places
    var clubs = value['clubs'];
    var resturants = value['resturants'];
    var beaches = value['beaches'];

    //adding in list of places pbjects
    for (int i = 0; i < clubs.length; i++) {
      _clubs.add(Place.fromJson(clubs[i]));
    }
    for (int i = 0; i < resturants.length; i++) {
      _resturants.add(Place.fromJson(resturants[i]));
    }
    for (int i = 0; i < beaches.length; i++) {
      _beaches.add(Place.fromJson(beaches[i]));
    }
    notifyListeners();
  }

  Future<bool> getPlaces(headers) async {
    setFetchingData(true);
    var places = await api.getPlaces(headers);
    if (places['success'] == true) {
      setPlaces(places);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(places['message']);
      setFetchingData(false);
      return false;
    }
  }
}
