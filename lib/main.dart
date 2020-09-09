import 'package:flutter/material.dart';
import 'package:kishanapp/constants.dart';
import 'package:kishanapp/screens/homescreen.dart';
import 'package:kishanapp/screens/loginscreen.dart';
import 'package:kishanapp/screens/splashscreen.dart';
import 'package:kishanapp/screens/signupscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(EasyLocalization(
      supportedLocales: [ 
        Locale('en', 'US'), 
        Locale('gu', 'IN'), 
        Locale('hi', 'IN'),
        Locale('mr', 'IN'),
        Locale('pa', 'IN'),
        ],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
    ),
   );
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
    );
  }
}