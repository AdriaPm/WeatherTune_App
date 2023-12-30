import 'package:flutter/material.dart';
import 'package:weather_tune/data/getWeather_getBackground.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
