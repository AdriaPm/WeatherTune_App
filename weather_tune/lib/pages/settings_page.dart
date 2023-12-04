import 'package:flutter/material.dart';
import 'package:weather_tune/components/dropdown_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(children: [
      DropDownButton(
          widgetWidth: 200,
          title: "Language",
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("English", style: TextStyle(color: Colors.white))))
    ])));
  }
}
