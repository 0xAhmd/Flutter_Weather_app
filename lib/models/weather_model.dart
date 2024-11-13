class WeatherModel {
  String date;
  int temp;
  double maxTemp;
  double minTemp;
  String WeatherstateName;

  WeatherModel({
    required this.temp,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.WeatherstateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
      temp: jsonData['avgtemp_c'],
      date: data['location']['localtime'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      WeatherstateName: jsonData['condition']['text'],
    );
  }
}
