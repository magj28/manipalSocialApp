import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PromoCard extends StatelessWidget {
  final String imageUrl, title, description, subDescription;
  final Function onTap;
  PromoCard(this.imageUrl, this.title, this.description, this.subDescription,
      this.onTap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 5.5 / 3,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.darken))),
            ),
            Container(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Coming Up',
                    style: TextStyle(
                        color: Color(0xffFC2E7E),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(title,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff1B90CE))),
                  Column(
                    children: [
                      Text(description,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      Text(subDescription,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
