import 'package:kishanapp/model/news.dart';
import 'package:flutter/material.dart';
import 'package:kishanapp/screens/newsdetails.dart';
 
class NewsCard extends StatelessWidget {
  final News news;
 
  NewsCard({this.news});
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(news.imageUrl, fit: BoxFit.cover, width: 100.0, height: double.infinity,),
            title: Text(news.title,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),),
            subtitle: Text(news.date,style:TextStyle(fontSize: 11.0,),textAlign: TextAlign.right,),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return NewsDetails(news);
	          }))},
          )
        ],
      ),
    );
  }
}