import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_using_provider/models/weather_model.dart';

class WeatherServices {
  static const String _baseUrl = 'http://api.weatherapi.com/v1';
  static const String _apiKey = '19ad2dfcb89f404cbb9210423241111'; // Weather API key

  /// Fetches weather data for a specific city.
  ///
  /// [cityName] is the name of the city for which the weather is requested.
  /// Throws an exception if the request fails or the response is invalid.
  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      final Uri url = Uri.parse('$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=7');
      
      // Sending the GET request to the weather API
      final http.Response response = await http.get(url);

      // Check for HTTP errors
      if (response.statusCode != 200) {
        throw Exception('Failed to load weather data. HTTP Status: ${response.statusCode}');
      }

      // Parse the JSON response
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Validate the response structure
      if (data.isEmpty || !data.containsKey('forecast')) {
        throw Exception('Invalid weather data received');
      }

      return WeatherModel.fromJson(data);
    } catch (e) {
      // Handle and log errors
      throw Exception('Error fetching weather data: $e');
    }
  }
}
