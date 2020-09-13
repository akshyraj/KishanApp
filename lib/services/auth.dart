import 'package:firebase_auth/firebase_auth.dart';
import 'package:kishanapp/model/users.dart';

class Authservice {

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
