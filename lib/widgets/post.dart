import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String ownerId, postId, username, query, mediaUrl;
  Post({
    this.username,
    this.query,
    this.mediaUrl,
    this.postId,
    this.ownerId,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      ownerId: doc['ownerId'],
      postId: doc['postId'],
      username: doc['username'],
      query: doc['query'],
      mediaUrl: doc['mediaUrl'],
    );
  }
  @override
  _PostState createState() => _PostState(
        postId: this.postId,
        username: this.username,
        ownerId: this.ownerId,
        mediaUrl: this.mediaUrl,
        query: this.query,
      );
}

class _PostState extends State<Post> {
  final String ownerId, postId, username, query, mediaUrl;
  _PostState({
    this.username,
    this.query,
    this.mediaUrl,
    this.postId,
    this.ownerId,
  });

  buildPostImage() {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.network(mediaUrl),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostImage(),
      ],
    );
  }
}
