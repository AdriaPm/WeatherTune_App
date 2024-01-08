// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:weather_tune/components/login_page/on_off_slider.dart';
import 'package:weather_tune/widgets/settings_page/language_selector.dart';
import 'package:weather_tune/widgets/settings_page/unit_selector.dart';
import 'package:weather_tune/widgets/settings_page/profile_button.dart';
import 'package:weather_tune/widgets/settings_page/open_website.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  final double margins = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: const Color.fromARGB(207, 255, 255, 255),
        toolbarHeight: 50,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 66, 9, 56),
              Color.fromARGB(255, 24, 5, 53)
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: margins),
              ProfileButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
              ),
              SizedBox(height: margins),
              SliderButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Alerts",
              ),
              SizedBox(height: margins),
              LanguageSelector(englishActive: true, spanishActive: false),
              SizedBox(height: margins),
              UnitSelector(),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Location and Weather Services",
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          "The resource used to provide these services: ",
                          style: TextStyle(color: Colors.white)),
                      Hyperlink(
                          link: "https://openweathermap.org/api",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 113, 210, 255),
                              decoration: TextDecoration.underline))
                    ],
                  ),
                ),
              ),
              SizedBox(height: margins),
            ],
          ),
        ),
      ),
    );
  }
}
