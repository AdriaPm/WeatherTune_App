import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_tune/components/api_bloc_routing/route_info.dart';
import 'package:weather_tune/firebase/firebase_options.dart';
import 'package:weather_tune/pages/favorites_page.dart';
import 'package:weather_tune/pages/radar_page.dart';
import 'package:weather_tune/pages/settings_page.dart';
import 'package:weather_tune/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeatherTune",
      debugShowCheckedModeBanner: false,
      routes: {
        "/details": (context) => const DetailsAPI(),
        "/radar": (context) => const RadarPage(),
        "/favorites": (context) => FavoritePage(),
        "/settings": (context) => const SettingsPage()
      },
      home: const SplashPage(screenLoadingTime: 4),
    );
  }
}
