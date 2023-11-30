import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_tune/auth/auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.screenLoadingTime,
  });

  /// Fake screen loading time for the SplashPage screen, measured in seconds(sec).
  final int screenLoadingTime;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<Color> backgroundGradientColors = [
    Colors.indigo.shade900,
    Colors.indigo,
    Colors.deepPurple,
    Colors.purple,
  ];

  double sliderValue = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Start a timer to update the slider value
    _timer = Timer.periodic(
      const Duration(milliseconds: 100), // Update every 100 milliseconds
      (timer) {
        setState(() {
          sliderValue += 100 / (widget.screenLoadingTime * 1000);
          if (sliderValue >= 1.0) {
            // If the slider reaches the end, navigate to AuthPage
            _timer.cancel(); // Stop the timer
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthPage(),
              ),
            );
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: backgroundGradientColors,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "images/WeatherTuneLogo_ORIGINAL.png",
                scale: 1,
              ),
              CircularProgressIndicator(
                color: Colors.purple.shade900,
                strokeAlign: 3,
                strokeCap: StrokeCap.round,
                strokeWidth: 8,
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: sliderValue,
                  color: Colors.pink.shade600,
                  backgroundColor: Colors.purple.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
