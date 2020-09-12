import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/screens/homeScreen.dart';
import 'package:manipalsocial/UI/screens/signUp.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  Widget decideScreen(authStatus) {
    if (authStatus == Status.Authenticated) {
      return HomeScreen();
    } else if (authStatus == Status.Unauthenticated) {
      return SignUpScreen();
    } else {
      return SignUpScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authStatus = Provider.of<UserViewModel>(context).status;
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: decideScreen(authStatus),
      title: Text(
        'Manipal Social',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
          color: Color(0xffFC2E7E),
        ),
      ),
      image: Image.asset('assets/images/mainLogo.png'),
      backgroundColor: Color(0xff131132),
      styleTextUnderTheLoader: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
      loadingText: Text(
        'Loading...',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      photoSize: 100.0,
      loaderColor: Color(0xffFC2E7E),
    );
  }
}
