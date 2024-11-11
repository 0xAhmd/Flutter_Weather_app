import 'package:http/http.dart' as http;

class WeatherServices {
  // Method to fetch weather data using the city name
  void getWeatherData({required String cityName}) async {
    // Constructing the URL for the GET request
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=19ad2dfcb89f404cbb9210423241111&q=$cityName&aqi=no');
    
    // Sending the GET request to the constructed URL
    // The response is awaited since the call is asynchronous
    http.Response response = await http.get(url);

    // The response object now holds the HTTP response data
    // You can parse it further to extract specific weather information
  }
}
