class WeatherModel {
  String date;
  double temp;
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

  String getImage() {
    switch (WeatherstateName.toLowerCase()) {
      case 'sunny':
        return 'assets/images/Sunny.png';
      case 'cloudy':
      case 'overcast':
        return 'assets/images/Cloudy.png';
      case 'rainy':
      case 'showers':
      case 'light rain':
        return 'assets/images/Rainy.png';
      case 'thunderstorm':
      case 'stormy':
        return 'assets/images/thunderstorm.png';
      case 'snowy':
      case 'snow':
      case 'blizzard':
        return 'assets/images/Snow.png';
      case 'foggy':
      case 'mist':
        return 'assets/images/foggy.png';
      case 'hazy':
        return 'assets/images/hazy.png';
      default:
        return 'assets/images/Default.png'; // Default image for undefined weather states
    }
  }


  

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      temp: jsonData['avgtemp_c'],
      date: data['location']['localtime'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      WeatherstateName: jsonData['condition']['text'],
    );
  }

  get avgtemp_c => null;
  @override
  String toString() {
    return 'WeatherModel{temp: $temp, date: $date, maxTemp: $maxTemp, minTemp: $minTemp, WeatherstateName: $WeatherstateName}';
  }
}
