import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_using_provider/models/weather_model.dart';
import 'package:weather_app_using_provider/providers/weather_provider.dart';
import 'package:weather_app_using_provider/views/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUI() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).WeatherData;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage(
                        updateUI: updateUI,
                      );
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.black,
        title: Text(
          'Weather App',
          style: GoogleFonts.spaceMono(
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "There is no weather to show here\nsearch for a city name to get the weather",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 6),
                Text(
                  Provider.of<WeatherProvider>(context, listen: true).cityName!,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Last updated: ${weatherData?.date}",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: Image.asset(
                        weatherData?.getImage() ?? "assets/images/sun.png",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "${weatherData?.temp.toInt().toString() ?? "N/A"}°C",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Max: ${weatherData?.maxTemp.toInt() ?? 'N/A'}°C",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Min: ${weatherData?.minTemp.toInt() ?? "N/A"}°C",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  weatherData?.WeatherstateName ?? "N/A",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 6),
              ],
            ),
    );
  }
}
