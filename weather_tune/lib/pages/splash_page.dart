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

  @override
  void initState() {
    super.initState();

    // Wait 5 second until jumping to the Login/Register
    Timer(
      Duration(seconds: widget.screenLoadingTime),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthPage(),
          ),
        );
      },
    );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
