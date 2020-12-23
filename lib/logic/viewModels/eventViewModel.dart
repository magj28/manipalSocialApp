import 'package:flutter/cupertino.dart';
import 'package:manipalsocial/logic/models/Event.dart';
import 'package:manipalsocial/logic/models/UpcomingEvent.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:manipalsocial/services/webApi.dart';

class EventViewModel with ChangeNotifier {
  //making instance of web api to use their function
  WebApi api = WebApi();
  UserViewModel user = UserViewModel();

  List<Event> _events = List<Event>();
  List<ComingEvent> _upcomingEvents = List<ComingEvent>();
  bool _isFetchingData = false;
  String _errorMessage;
  ComingEvent _singleUpcomingEvent;

  //getters
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;
  List<Event> get events => _events;
  List<ComingEvent> get upcomingevents => _upcomingEvents;
  ComingEvent get singleUpcomingEvent => _singleUpcomingEvent;

  //setters
  setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  setSingleUpcomingEvent(value) {
    _singleUpcomingEvent = value;
  }

  setEvents(value) {
    //clearing the previously filled data so that data doesn't get repeated
    _events.clear();

    //initializing arrays of events
    var events = value['events'];

    //adding in list of places objects
    for (int i = 0; i < events.length; i++) {
      _events.add(Event.fromJson(events[i]));
    }

    notifyListeners();
  }

  setUpcomingEvents(value) {
    _upcomingEvents.clear();

    //initializing arrays of events
    var upcomingEvents = value['upcomingEvents'];

    //adding in list of places objects
    for (int i = 0; i < upcomingEvents.length; i++) {
      _upcomingEvents.add(ComingEvent.fromJson(upcomingEvents[i]));
      print(_upcomingEvents[i].contacts);
    }

    notifyListeners();
  }

  Future<bool> getEvents(headers) async {
    setFetchingData(true);
    var events = await api.getEvents(headers);
    if (events['success'] == true) {
      setEvents(events);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(events['message']);
      setFetchingData(false);
      return false;
    }
  }

  Future<bool> getUpcomingEvents(headers) async {
    setFetchingData(true);
    var upcomingEvent = await api.getUpcomingEvents(headers);
    if (upcomingEvent['success'] == true) {
      setUpcomingEvents(upcomingEvent);
      setFetchingData(false);
      return true;
    } else {
      setErrorMessage(upcomingEvent['message']);
      setFetchingData(false);
      return false;
    }
  }
}
