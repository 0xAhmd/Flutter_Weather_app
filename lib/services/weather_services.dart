import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_using_provider/models/weather_model.dart';

class WeatherServices {
  String BaseUrl = 'http://api.weatherapi.com/v1';
  String APIKEY =
      '19ad2dfcb89f404cbb9210423241111'; // Base URL for the weather API
  // Method to fetch weather data using the city name
  Future<WeatherModel> getWeatherData({required String cityName}) async {
    // Constructing the URL for the GET request
    Uri url =
        Uri.parse('$BaseUrl/forecast.json?key=$APIKEY&q=$cityName&days=7');

    // Sending the GET request to the constructed URL
    http.Response response = await http.get(url);

    // Parsing JSON response
    Map<String, dynamic> data = jsonDecode(response.body);

    // You can now access forecast data in the `data` map
    var jsonData = data['forecast']['forecastday'][0];

    WeatherModel weather = WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        WeatherstateNam: jsonData['condition']['text']);

    return weather;
  }
}
