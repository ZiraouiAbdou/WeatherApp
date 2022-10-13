import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Widget icon;
  final String? status;
  final String type;

  const WeatherCard(
      {super.key,
      required this.icon,
      required this.status,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(
          height: 10,
        ),
        Text(
          status!,
          style: const TextStyle(fontSize: 15),
        ),
        Text(
          type,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
