import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
String SPLASH_SCREEN='SPLASH_SCREEN';
// ignore: non_constant_identifier_names
String LOGIN_SCREEN='LOGIN_SCREEN';
// ignore: non_constant_identifier_names
String HOME_SCREEN='HOME_SCREEN';
// ignore: non_constant_identifier_names
String SIGNUP_SCREEN='SIGNUP_SCREEN';

final kHintTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);