import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_using_provider/views/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        return  SearchPage();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: (Colors.white),
                )),
          )
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
      body: Center(
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
      ),
    );
  }
}
