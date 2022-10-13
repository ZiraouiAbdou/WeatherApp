import 'package:flutter/material.dart';

import 'cards_divider.dart';
import 'weather_card.dart';

class WeatherInfos extends StatelessWidget {
  final double? wind;
  final String? country;
  final int? humidity;
  const WeatherInfos(
      {super.key,
      required this.country,
      required this.wind,
      required this.humidity});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherCard(
              icon: Image.asset(
                "assets/icons/wind.png",
                height: 40,
                width: 40,
              ),
              status: "${((wind! * 60 * 60) / 1000).toStringAsFixed(2)} klm/h",
              type: "Wind Speed"),
          const CardDivider(),
          WeatherCard(
              icon: Image.asset(
                "assets/icons/humidity.png",
                height: 40,
                width: 40,
              ),
              status: "$humidity%",
              type: "Humidity"),
          const CardDivider(),
          WeatherCard(
              icon: Image.asset(
                "assets/icons/countries.png",
                color: Colors.greenAccent,
                height: 40,
                width: 40,
              ),
              status: country,
              type: "Country"),
        ],
      ),
    );
  }
}
