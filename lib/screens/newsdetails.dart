import 'package:kishanapp/model/news.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsDetails extends StatelessWidget {
  News news;
  NewsDetails(this.news);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
		    Navigator.pop(context);
	    },
      child: Scaffold(
        backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text(news.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left, 
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Card(
                elevation: 5,
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(news.imageUrl)
                          ,
                        ),
                      ),
                    ),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text(news.content,
              ),
            ), 
          ]
        )
      )
      ),
    );
  }
}
