import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/customCard.dart';
import 'package:manipalsocial/logic/viewModels/placeViewModel.dart';
import 'package:provider/provider.dart';

class PlacesScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<PlaceViewModel>(context);
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
        centerTitle: true,
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
                  borderRadius: BorderRadius.circular(20.0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/placeGeneral.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    _tabs('Beaches'),
                    _tabs('Restaurants'),
                    _tabs('Clubs'),
                  ],
                ),
              ),
              Flexible(
                child: Provider.of<PlaceViewModel>(context).isFetchingData
                    ? CircularProgressIndicator()
                    : TabBarView(
                        children: [
                          ListView.builder(
                            itemCount: places.beaches.length,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                imageurl: "assets/images/beachLogo.png",
                                name: places.beaches[index].name,
                                info: places.beaches[index].what,
                                onTap: () {
                                  places.setSinglePlace(places.beaches[index]);
                                  Navigator.pushNamed(context, '/placeSingle');
                                },
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: places.resturants.length,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                  imageurl: "assets/images/resturantLogo.png",
                                  name: places.resturants[index].name,
                                  info: places.resturants[index].what,
                                  onTap: () {
                                    places.setSinglePlace(
                                        places.resturants[index]);
                                    Navigator.pushNamed(
                                        context, '/placeSingle');
                                  });
                            },
                          ),
                          ListView.builder(
                            itemCount: places.clubs.length,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                  imageurl: "assets/images/clubLogo.png",
                                  name: places.clubs[index].name,
                                  info: places.clubs[index].what,
                                  onTap: () {
                                    places.setSinglePlace(places.clubs[index]);
                                    Navigator.pushNamed(
                                        context, '/placeSingle');
                                  });
                            },
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
