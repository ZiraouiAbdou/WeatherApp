// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:weather_pp/screens/weather_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cityName = new TextEditingController();
    GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Enter city",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: cityName,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: "City: ..."),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a city";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeatherScreen(
                                    cityName: cityName.text,
                                  )));
                    }
                  },
                  child: const Text("Search"))
            ],
          ),
        ),
      ),
    );
  }
}
