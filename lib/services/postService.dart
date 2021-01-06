import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kishanapp/services/auth.dart';

class PostService {
  // ignore: unused_field
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _post = FirebaseFirestore.instance.collection('Posts');
  Authservice _userService = new Authservice();

  Future<List> getPost() async {
    List<Map<String, String>> postList = new List();
    QuerySnapshot postsRef = await _post.get();
    for (DocumentSnapshot docRef in postsRef.docs) {
      Map<String, String> posts = new Map();
      posts['postId'] = docRef.data()['postId'].toString();
      posts['ownerId'] = docRef.data()['ownerId'];
      posts['username'] = docRef.data()['username'];
      posts['mediaUrl'] = docRef.data()['mediaUrl'].toString();
      posts['query'] = docRef.data()['query'];
      postList.add(posts);
    }
    return postList;
  }
}
