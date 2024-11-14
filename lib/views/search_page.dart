import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_using_provider/models/weather_model.dart';
import 'package:weather_app_using_provider/providers/weather_provider.dart';
import 'package:weather_app_using_provider/services/weather_services.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUI});
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
              WeatherModel weather =
                  await service.getWeatherData(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).WeatherData =
                  weather;

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
