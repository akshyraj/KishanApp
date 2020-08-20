import 'package:flutter/material.dart';
import 'package:kishanapp/constants.dart';
import 'package:kishanapp/screens/homescreen.dart';
import 'package:kishanapp/screens/loginscreen.dart';
import 'package:kishanapp/screens/splashscreen.dart';
import 'package:kishanapp/screens/signupscreen.dart';


void main() => runApp(MaterialApp(
      title: 'GridView Demo',
      home: SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color(0xFF761322),
      ),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
        HOME_SCREEN: (BuildContext context) => HomeScreen(),
        SIGNUP_SCREEN: (BuildContext context) => SignupScreen(),
        //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
      },
    ));

