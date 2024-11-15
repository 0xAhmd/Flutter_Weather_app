// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_using_provider/models/weather_model.dart';
import 'package:weather_app_using_provider/providers/weather_provider.dart';
import 'package:weather_app_using_provider/services/weather_services.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({super.key, this.updateUI});
  VoidCallback? updateUI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          'Search a City',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            keyboardType: TextInputType.text,
            onSubmitted: (val) async {
              cityName = val;
              WeatherServices service = WeatherServices();
              WeatherModel? weather =
                  await service.getWeatherData(cityName: cityName!);

              // ignore: unnecessary_null_comparison
              if (weather != null) {
                // ignore: duplicate_ignore
                // ignore: use_build_context_synchronously
                Provider.of<WeatherProvider>(context, listen: false)
                    .WeatherData = weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                           Text("Could not fetch weather data. Try again!")),
                );
              }

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              label: Text('Insert City Name'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: 'Enter City Name',
            ),
          ),
        ),
      ),
    );
  }
}
