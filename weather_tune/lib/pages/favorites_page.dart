import 'package:flutter/material.dart';
import 'package:weather_tune/data/getWeather_getBackground.dart';

class FavoritePage extends StatelessWidget {
  final List<LocationData> locations = [
    LocationData('New York', 'sunny', '25°C'),
    LocationData('London', 'cloudy', '13°C'),
    LocationData('Tokyo', 'rainy', '20°C'),
    LocationData('Paris', 'snowy', '-2°C'),
    LocationData('Sydney', 'foggy', '22°C'),
    LocationData('Berlin', 'stormy', '15°C'),
    // Add more locations as needed
  ];

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Stack(
        children: [
          // Background with a gradient or an image
          // You can replace this with your desired background
          // Background image covering the entire app
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/favorites_bkg.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),

          // List of location boxes
          Positioned.fill(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: LocationBox(
                    location: locations[index].location,
                    weatherCondition: locations[index].weatherCondition,
                    temperature: locations[index].temperature,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LocationBox extends StatelessWidget {
  final String location;
  final String weatherCondition;
  final String temperature;

  const LocationBox({
    super.key,
    required this.location,
    required this.weatherCondition,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.5), // Set opacity here
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  temperature,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LocationData {
  final String location;
  final String weatherCondition;
  final String temperature;

  LocationData(this.location, this.weatherCondition, this.temperature);
}
