import 'package:flutter/material.dart';
import 'package:weather_app_using_provider/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _WeatherData;
  String? cityName;

  set WeatherData(WeatherModel? weather) {
    _WeatherData = weather;
    notifyListeners();
  }

  WeatherModel? get WeatherData => _WeatherData;
}
