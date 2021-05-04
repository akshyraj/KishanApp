import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:kishanapp/services/auth.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

Authservice _authservice = new Authservice();
_WeatherPageState() {
    userData();
  }

  userData() async {
    Map<String, dynamic> userdetails = await _authservice.getUserDetails();
    setState(() {
      pincode = userdetails['zipcode'];
    });
  }

  final String apiUrl =
      "http://api.openweathermap.org/data/2.5/forecast?q=" + pincode + ",in&appid=f6950dfa767d426784a7faa9ca415fa1";

  static String pincode = "";
  Future<List<dynamic>> fetchWeather() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['list'];
  }

  double _temp(dynamic weather) {
    return weather['main']['temp'] / 10;
  }

  double _maxtemp(dynamic weather) {
    return weather['main']['temp_max'] / 10;
  }

  double _mintemp(dynamic weather) {
    return weather['main']['temp_min'] / 10;
  }

  int _humidity(dynamic weather) {
    return weather['main']['humidity'];
  }

  String _date(dynamic weather) {
    return weather['dt_txt'];
  }

  String _description(dynamic weather) {
    return weather['weather'][0]['description'];
  }

  String _weather(dynamic weather) {
    return 'http://openweathermap.org/img/w/${weather['weather'][0]['icon']}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather').tr(),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchWeather(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                              _weather(snapshot.data[index]),
                            ),
                            title: Text((_description(snapshot.data[index])
                                .toString()
                                .toUpperCase())),
                            subtitle: Text("Temprature           :  " +
                                (_temp(snapshot.data[index])
                                    .toStringAsFixed(2)) +
                                "\n" +
                                "Max Temprature  :  " +
                                (_maxtemp(snapshot.data[index])
                                    .toStringAsFixed(2)) +
                                "\n" +
                                "Min Temprature   :  " +
                                (_mintemp(snapshot.data[index])
                                    .toStringAsFixed(2)) +
                                "\n" +
                                "Humidity               :  " +
                                (_humidity(snapshot.data[index]).toString()) +
                                "\n" +
                                "Date and Time     :  " +
                                (_date(snapshot.data[index]))),
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
