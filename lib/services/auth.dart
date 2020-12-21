import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kishanapp/model/users.dart';

class Authservice {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Users _userFromFirebaseUser(User user){
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get user{
    // ignore: deprecated_member_use
    return _auth.onAuthStateChanged.map((User user) => _userFromFirebaseUser(user));
  }

  
  Future singInWithEmailandPassword(String email, String password) async{
    try{
       User user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
       return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future singUpWithEmailandPassword(String email, String password, String name, String place, String district, String state, String zipcode) async{
    try{
       User user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
       db.collection('Users').doc(user.uid).set(
         {
           'name' : name,
           'uid' : user.uid,
           'email' : user.email,
           'place' : place,
           'district' : district,
           'state' : state,
           'zipcode' : zipcode
         }
       ).then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    return '1';
    }catch(e){
      if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
  }
    }
  }

  Future<String> getUserId() async{
    var uid = _auth.currentUser.uid;
    return uid;
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
