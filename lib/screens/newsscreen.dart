import 'package:kishanapp/model/news.dart';
import 'package:kishanapp/widgets/news-card.dart';
import 'package:flutter/material.dart';
 
class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPageState();
  }
}
 
class _NewsPageState extends State<NewsPage> {
  final List<News> news = NewsList.getNews();
 
  Widget _buildNewsList() {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsCard(news: news[index]);
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNewsList(),
    );
  }
}