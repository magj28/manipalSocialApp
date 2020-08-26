import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacesHomeScreen extends StatefulWidget {
  @override
  _PlacesHomeScreenState createState() => _PlacesHomeScreenState();
}

double _width;

class _PlacesHomeScreenState extends State<PlacesHomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    _width:
    MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xff131132),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Places',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color(0xff131132),
        ),
        body: DefaultTabController(
          length: 4,
          child: Container(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Center(
                    child: Image.network(
                      'https://cdn1.goibibo.com/t_tg_fs/udupi-manipal-149527119186-orijgp.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TabBar(
                  isScrollable: true,
                  //indicatorSize: ,
                  tabs: [
                    _tabs('Beaches'),
                    _tabs('Restaurants'),
                    _tabs('Clubs'),
                    _tabs('Hotels'),
                  ],
                ),
              ),
              _placeCard(
                  'https://images-na.ssl-images-amazon.com/images/I/81pXIfXekjL._SL1500_.jpg',
                  'MALPE BEACH',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
            ],
          )),
        ));
  }
}

_tabs(String tab) {
  return Container(
    child: Tab(
      text: tab,
    ),
    padding: EdgeInsets.only(left: 20, right: 20),
  );
}

_placeCard(String imageurl, String name, String info) {
  return Opacity(
    opacity: 0.8,
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(15.0),
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xff1D1D3E),
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
                radius: 40.0,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text(
                      info,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
