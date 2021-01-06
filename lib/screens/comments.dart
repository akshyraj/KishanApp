
import 'dart:io';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kishanapp/services/auth.dart';
import 'package:kishanapp/widgets/progress.dart';


class Comments extends StatefulWidget {

  final String postId, postOwnerId,mediaUrl;
  Comments({this.postId,this.mediaUrl,this.postOwnerId});
  @override
  CommentsState createState() => CommentsState(
    postId: this.postId,
    postOwnerId: this.postOwnerId,
    mediaUrl: this.mediaUrl
  );
}

class CommentsState extends State<Comments> {

  final commentsRef = FirebaseFirestore.instance.collection('Comments');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Authservice _authservice = new Authservice();
  final String postId, postOwnerId,mediaUrl;
  String username = '';
  TextEditingController commentController = TextEditingController();
  CommentsState({this.postId,this.mediaUrl,this.postOwnerId}){
    userData();
  }

  get timeStamp => null;

  userData() async {
    Map<String, dynamic> userdetails = await _authservice.getUserDetails();
    setState(() {
      username = userdetails['name'];
    });
  }

  addComment()
  {
    commentsRef.doc(postId).collection('comment')
      .add({
      "username":username,
      "comment":commentController.text,
      "timeStamp":timeStamp,
    });
    commentController.clear();
  }

  buildComments(){
    return StreamBuilder(
      stream: commentsRef.doc(postId).collection('comment')
      .orderBy('timeStamp',descending: true).snapshots(),
      builder: (context,snapShot){
        if (!snapShot.hasData)
          {
            return circularProgress();
          }
        List<Comment> comments=[];
        snapShot.data.documents.forEach((doc){
          comments.add(Comment.fromDocument(doc));
        });
        return ListView(
          children: comments
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildComments(),),
          Divider(),
          ListTile(
            title: TextFormField(controller: commentController,
            decoration: InputDecoration(labelText: "Write a comment ..."),),
            trailing: OutlineButton(
              onPressed: addComment,
              borderSide: BorderSide.none,
              child: Text("Comment"),
            ),
          ),
        ],
      ),
    );
  }
}
class Comment extends StatelessWidget {
  final String username,userId,avatarUrl,comment;
  final Timestamp timestamp;
  Comment({
   this.username, this.userId, this.avatarUrl, this.comment, this.timestamp,
  });
  factory Comment.fromDocument(DocumentSnapshot doc){
    return Comment(
      username: doc['username'],
      comment: doc['comment'],
      timestamp: doc['timeStamp'],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(comment),
          subtitle: Text(username)
        ),
        Divider(),
      ],
    );
  }
}