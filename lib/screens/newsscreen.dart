import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final String apiUrl =
      "https://gnews.io/api/v3/search?country=in&q=agriculture&token=1ca6d02c776fe5ac0caefa72790d5c6c";
  Future<List<dynamic>> fetchnews() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['articles'];
  }

  Image _image(dynamic news) {
    if (news['image'] != null) {
      return Image.network(
        news['image'],
        fit: BoxFit.cover,
        width: 100.0,
        height: double.infinity,
      );
    } else {
      return Image.asset('assets/logo.jpg');
    }
  }

  String _title(dynamic news) {
    return news['title'];
  }

  String _source(dynamic news) {
    return news['source']['name'];
  }

  String _url(dynamic news) {
    return news['url'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchnews(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: _image(
                              snapshot.data[index],
                            ),
                            title: Text(
                              _title(snapshot.data[index]),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              _source(snapshot.data[index]),
                              style: TextStyle(
                                fontSize: 11.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            onTap: () {
                              launch(_url(snapshot.data[index]));
                            },
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
