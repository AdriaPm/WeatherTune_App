import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  final double margins = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      DropDownButton(
          widgetWidth: MediaQuery.sizeOf(context).width,
          title: "Language",
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("English",
                          style: TextStyle(color: Colors.white))),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Spanish",
                          style: TextStyle(color: Colors.white))),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("French",
                          style: TextStyle(color: Colors.white))),
                ],
              ))),
      const SizedBox(height: margins),
      DropDownButton(
          widgetWidth: MediaQuery.sizeOf(context).width,
          title: "Alerts",
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("English", style: TextStyle(color: Colors.white)))),
      const SizedBox(height: margins),
      DropDownButton(
          widgetWidth: MediaQuery.sizeOf(context).width,
          title: "Units",
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Celsius (Cº)",
                          style: TextStyle(color: Colors.white))),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Fahrenheit (Fº)",
                          style: TextStyle(color: Colors.white))),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Kelvin (K)",
                          style: TextStyle(color: Colors.white))),
                ],
              ))),
      const SizedBox(height: margins),
      DropDownButton(
          widgetWidth: MediaQuery.sizeOf(context).width,
          title: "Location Services",
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("English", style: TextStyle(color: Colors.white)))),
      const SizedBox(height: margins),
      DropDownButton(
          widgetWidth: MediaQuery.sizeOf(context).width,
          title: "Weather Services",
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text("English", style: TextStyle(color: Colors.white)))),
      const SizedBox(height: margins),
    ])));
  }
}
