import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/modifiable_textbox.dart';

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ModifiableTextbox(
        defaultText: "example@gmail.com",
        mainTextStyle: const TextStyle(
            color: Color.fromARGB(255, 209, 201, 213), fontSize: 16),
        fieldTextStyle: const TextStyle(
            color: Color.fromARGB(255, 209, 201, 213), fontSize: 16),
        centeredText: false,
      ),
    );
  }
}
