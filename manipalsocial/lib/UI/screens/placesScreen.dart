import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double _width;

class PlacesHomeScreen extends StatelessWidget {
  List<Place> _beaches = [
    Place(
        url:
            'https://images-na.ssl-images-amazon.com/images/I/81pXIfXekjL._SL1500_.jpg',
        name: 'MALPE BEACH',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
    Place(
        url:
            'https://images-na.ssl-images-amazon.com/images/I/81pXIfXekjL._SL1500_.jpg',
        name: 'KAUP BEACH',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
    Place(
        url:
            'https://images-na.ssl-images-amazon.com/images/I/81pXIfXekjL._SL1500_.jpg',
        name: 'HOODE BEACH',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
  ];

  List<Place> _restaurants = [
    Place(
        url:
            'https://b7.pngbarn.com/png/553/457/computer-icons-girls-on-the-run-textured-food-logo-png-clip-art-thumbnail.png',
        name: 'EGG FACTORY',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
    Place(
        url:
            'https://b7.pngbarn.com/png/553/457/computer-icons-girls-on-the-run-textured-food-logo-png-clip-art-thumbnail.png',
        name: 'BACCHUS INN',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
    Place(
        url:
            'https://b7.pngbarn.com/png/553/457/computer-icons-girls-on-the-run-textured-food-logo-png-clip-art-thumbnail.png',
        name: 'EYE OF THE TIGER',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
  ];

  List<Place> _clubs = [
    Place(
        url:
            'https://cdn0.iconfinder.com/data/icons/old-people-care-blue-line/64/32_dance-party-disco-ball-512.png',
        name: 'DEETEE',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
    Place(
        url:
            'https://cdn0.iconfinder.com/data/icons/old-people-care-blue-line/64/32_dance-party-disco-ball-512.png',
        name: 'ZEAL',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
    Place(
        url:
            'https://cdn0.iconfinder.com/data/icons/old-people-care-blue-line/64/32_dance-party-disco-ball-512.png',
        name: 'EDGE',
        info:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
  ];

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
              style: TextStyle(color: Color(0xffFC2E7E)),
            ),
          ),
          backgroundColor: Color(0xff131132),
        ),
        body: DefaultTabController(
          length: 3,
          child: Container(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Center(
                    child: Image.network(
                      //'https://cdn1.goibibo.com/t_tg_fs/udupi-manipal-149527119186-orijgp.jpg',
                      //'https://ihpl.b-cdn.net/pictures/travelguide/other-images/dest_head_img-1131.jpeg',
                      'https://sis.manipal.edu/images/1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: _beaches.length,
                      itemBuilder: (context, index) {
                        return _placeCard(_beaches[index].url,
                            _beaches[index].name, _beaches[index].info);
                      },
                    ),
                    ListView.builder(
                      itemCount: _restaurants.length,
                      itemBuilder: (context, index) {
                        return _placeCard(_restaurants[index].url,
                            _restaurants[index].name, _restaurants[index].info);
                      },
                    ),
                    ListView.builder(
                      itemCount: _clubs.length,
                      itemBuilder: (context, index) {
                        return _placeCard(_clubs[index].url, _clubs[index].name,
                            _clubs[index].info);
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}

_tabs(String tab) {
  return Container(
    child: Tab(
      child: Text(
        tab,
        style: TextStyle(fontSize: 20.0, color: Color(0xffFC2E7E)),
      ),
    ),
    padding: EdgeInsets.only(left: 20, right: 20),
  );
}

_placeCard(String imageurl, String name, String info) {
  return GestureDetector(
    onTap: () {
      print(name + ' container clicked');
    },
    child: Container(
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
                        color: Color(0xff1B90CE),
                        fontSize: 20.0,
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
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    )),
  );
}

class Place {
  String url;
  String name;
  String info;
  Place({this.url, this.name, this.info});
}
