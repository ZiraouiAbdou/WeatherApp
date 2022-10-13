// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_pp/models/weather_model.dart';
import 'package:http/http.dart' as http;
import '../widgets/weather_infos.dart';
import 'no_city_name.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;
  const WeatherScreen({super.key, required this.cityName});

  Future<WeatherData> getData() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=08ae421d0283cfc2a859ffcd66d67cfa"));

    var body = jsonDecode(response.body);
    return WeatherData.fromJson(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 00, vertical: 00),
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.data!.cod.toString() != "200") {
                      return NoCityByThisNameScreen();
                    } else {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios_outlined),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    snapshot.data!.name.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Center(child: Icon(Icons.more_vert))
                            ],
                          ),
                          SizedBox(
                            height: 500,
                            width: double.infinity,
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      "${(snapshot.data!.main!.temp)!.ceil()}°",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 100,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${snapshot.data!.weather![0].main}\n${snapshot.data!.weather![0].description}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: WeatherInfos(
                                          humidity:
                                              snapshot.data!.main!.humidity,
                                          country: snapshot.data!.sys!.country,
                                          wind: snapshot.data!.wind!.speed),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  }))),
    );
  }
}
