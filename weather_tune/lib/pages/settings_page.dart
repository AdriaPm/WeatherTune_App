// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:weather_tune/components/login_page/on_off_slider.dart';
import 'package:weather_tune/widgets/settings_page/language_selector.dart';
import 'package:weather_tune/widgets/settings_page/unit_selector.dart';
import 'package:weather_tune/widgets/settings_page/profile_button.dart';

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
              UnitSelector(cisActive: true, fisActive: false, kisActive: false),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Location Services",
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "English",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Weather Services",
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "English",
                    style: TextStyle(color: Colors.white),
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
