import 'package:flutter/material.dart';
import 'package:manipalsocial/logic/viewModels/placeViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: FlatButton(
          onPressed: () {
            String headers =
                Provider.of<UserViewModel>(context, listen: false).headers;
            Provider.of<PlaceViewModel>(context, listen: false)
                .getPlaces(headers);
            Navigator.pushNamed(context, '/place');
          },
          child: Text('get places'),
        ),
      ),
    );
  }
}
