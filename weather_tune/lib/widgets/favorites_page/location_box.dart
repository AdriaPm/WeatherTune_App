import 'package:flutter/material.dart';
import 'package:weather_tune/data/getweather_getbackground.dart';

class LocationBox extends StatelessWidget {
  final String location;
  final int weatherCondition;
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
            getWeatherIcon(weatherCondition),
          ],
        ),
      ),
    );
  }
}
