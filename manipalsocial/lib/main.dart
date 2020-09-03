import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/screens/addExperience.dart';
import 'package:manipalsocial/UI/screens/cabShareScreen.dart';
import 'package:manipalsocial/UI/screens/chatScreen.dart';
import 'package:manipalsocial/UI/screens/experienceScreen.dart';
import 'package:manipalsocial/UI/screens/homeScreen.dart';
import 'package:manipalsocial/UI/screens/loginScreen.dart';
import 'package:manipalsocial/UI/screens/placeSingle.dart';
import 'package:manipalsocial/UI/screens/placesScreen.dart';
import 'package:manipalsocial/UI/screens/profileScreen.dart';
import 'package:manipalsocial/UI/screens/signUp.dart';
import 'package:manipalsocial/UI/screens/splashScreen.dart';
import 'package:manipalsocial/logic/viewModels/placeViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: UserViewModel.initialize(),
    ),
    ChangeNotifierProvider.value(
      value: PlaceViewModel(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manipal Social',
      theme: ThemeData(
        accentColor: Color(0xffFC2E7E),
        primaryColor: Color(0xffFC2E7E),
        canvasColor: Color(0xff131132),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/home': (context) => HomeScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/placeSingle': (context) => PlaceSingleScreen(),
        '/place': (context) => PlacesScreen(),
        '/profile': (context) => ProfileScreen(),
        '/cabShare': (context) => CarPage(),
        '/addExperience': (context) => AddExperienceScreen(),
        '/experience': (context) => ExperienceScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
