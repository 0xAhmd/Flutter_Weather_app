import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});
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
            onSubmitted: (val) {
              cityName = val;
              
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
