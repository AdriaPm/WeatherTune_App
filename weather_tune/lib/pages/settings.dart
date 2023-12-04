import 'package:flutter/material.dart';
import 'package:weather_tune/components/dropdown_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(children: [
      DropDownButton(
          widgetWidth: 200, title: "Language", child: Text("English"))
    ])));
  }
}
