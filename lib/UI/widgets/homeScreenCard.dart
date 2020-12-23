import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenCard extends StatelessWidget {
  final cardText, imageUrl;
  final Function onTap;
  HomeScreenCard(this.cardText, this.imageUrl, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        height: 155,
        width: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Color(0xff1D1D3E),
          boxShadow: [
            BoxShadow(
              color: Color(0xff1B90CE),
              spreadRadius: 1.5,
              blurRadius: 0.5,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Color(0xff1D1D3E),
              radius: 52,
              backgroundImage: AssetImage(imageUrl),
            ),

            // image: DecorationImage(
            //     image: AssetImage('assets/images/places.png'),
            //     fit: BoxFit.cover,
            //     colorFilter: ColorFilter.mode(
            //         Colors.black.withOpacity(0.6), BlendMode.darken)),
            Text(
              cardText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff1B90CE),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
