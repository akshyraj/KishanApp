import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class KishanApp
{
  static const String appName = 'Kishan App';

  static SharedPreferences sharedPreferences;
  // ignore: deprecated_member_use
  static FirebaseUser user;
  static FirebaseAuth auth;
  static FirebaseFirestore firestore;

  static String userCartList = 'userCart';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhotoUrl = 'photoUrl';
  static final String userUid = 'uid';
  static final String userAvatarUrl = 'url';
  static final String userPlace = 'place';
  static final String userDistrict = 'district';
  static final String userState = 'state';
  static final String userZipcode = 'zipcode';
  
}