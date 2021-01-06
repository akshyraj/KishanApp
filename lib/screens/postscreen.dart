
import 'package:flutter/material.dart';
import 'package:kishanapp/screens/comments.dart';
import 'package:kishanapp/services/postService.dart';


// ignore: must_be_immutable
class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostService _postService = new PostService();
  _PostScreenState() {
    listPostItems();
  }

  List featuredItems = new List(0);

  void listPostItems() async {
    List<Map<String, String>> featuredPostList = await _postService.getPost();
    setState(() {
      featuredItems = featuredPostList;
      print(featuredItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView.builder(
      itemCount: featuredItems.length,
      itemBuilder: (BuildContext context, int index) {
        return featuredItemCard(post: featuredItems[index]);
      },
    ));
  }
}

// ignore: camel_case_types
class featuredItemCard extends StatelessWidget {
  var post;
  featuredItemCard({this.post});

  showComments(BuildContext context,
      {String postId, String ownerId, String mediaUrl}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Comments(
        postId: postId,
        postOwnerId: ownerId,
        mediaUrl: mediaUrl,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Divider(height: 30.0),
          Row(
            children: <Widget>[
              CircleAvatar(
                child: Text("A"),
                radius: 20.0,
              ),
              SizedBox(width: 7.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post['username'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0)),
                  SizedBox(height: 5.0),
                ],
              ),
            ],
          ),
          Divider(height: 30.0),
          Text(post['query'], style: TextStyle(fontSize: 15.0)),
          Divider(height: 30.0),
          Card(
            child: Image.network(post['mediaUrl'], fit: BoxFit.fill),
          ),
          Divider(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => showComments(
                      context,
                      postId: post['postId'],
                      ownerId: post['ownerId'],
                      mediaUrl: post['mediaUrl'],
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.green,
                    child: Text('Put Your Answer Here !',
                        style: TextStyle(fontSize: 14.0)),
                  )
                ],
              ),
            ],
          ),
          Divider(height: 30.0),
        ],
      ),
    );
  }
}
