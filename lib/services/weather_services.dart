import 'package:http/http.dart' as http;

class WeatherServices {
  // method to get weather data using the city name
  void getWeatherData({required String cityName}) async {
// do a simple get request
// get method only takes a url as a object from uri

    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=19ad2dfcb89f404cbb9210423241111&q=$cityName&aqi=no');
    http.Response response = await http.get(url);
    // it is take time so we use async and await
    // format the data as a response and create a instance so we can use it later
  }
}
