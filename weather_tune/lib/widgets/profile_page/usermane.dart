import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/modifiable_textbox.dart';

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ModifiableTextbox(
        defaultText: "username",
        mainTextStyle: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        fieldTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centeredText: true,
      ),
    );
  }
}
