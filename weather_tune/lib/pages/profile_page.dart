import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  final double margins = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Privacy Settings",
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
                title: "Terms of Service",
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
                title: "Support",
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
