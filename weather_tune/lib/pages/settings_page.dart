// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:weather_tune/components/login_page/on_off_slider.dart';
import 'package:weather_tune/components/login_page/profile_picture.dart';
import 'package:weather_tune/components/login_page/menu_container.dart';

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
              const Text("Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
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
              SliderButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Dark Mode",
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

class LanguageSelector extends StatefulWidget {
  LanguageSelector(
      {super.key, required this.englishActive, required this.spanishActive});
  bool englishActive;
  bool spanishActive;

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return DropDownButton(
        widgetWidth: MediaQuery.sizeOf(context).width - 40,
        title: "Language",
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.spanishActive = false;
                        widget.englishActive = true;
                      });
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                          color: widget.englishActive
                              ? Colors.white
                              : const Color.fromARGB(255, 167, 143, 186)),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.spanishActive = true;
                        widget.englishActive = false;
                      });
                    },
                    child: Text(
                      "Spanish",
                      style: TextStyle(
                          color: widget.spanishActive
                              ? Colors.white
                              : const Color.fromARGB(255, 167, 143, 186)),
                    ),
                  ),
                ),
              ],
            )));
  }
}

class UnitSelector extends StatefulWidget {
  UnitSelector(
      {super.key,
      required this.fisActive,
      required this.cisActive,
      required this.kisActive});
  bool fisActive;
  bool cisActive;
  bool kisActive;

  @override
  State<UnitSelector> createState() => _UnitSelectorState();
}

class _UnitSelectorState extends State<UnitSelector> {
  @override
  Widget build(BuildContext context) {
    return DropDownButton(
        widgetWidth: MediaQuery.sizeOf(context).width - 40,
        title: "Units",
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.fisActive = true;
                        widget.cisActive = false;
                        widget.kisActive = false;
                      });
                    },
                    child: Text(
                      "Fahrenheit (Fº)",
                      style: TextStyle(
                          color: widget.fisActive
                              ? Colors.white
                              : const Color.fromARGB(255, 167, 143, 186)),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.fisActive = false;
                        widget.cisActive = true;
                        widget.kisActive = false;
                      });
                    },
                    child: Text(
                      "Celsius (Cº)",
                      style: TextStyle(
                          color: widget.cisActive
                              ? Colors.white
                              : const Color.fromARGB(255, 167, 143, 186)),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.fisActive = false;
                        widget.cisActive = false;
                        widget.kisActive = true;
                      });
                    },
                    child: Text(
                      "Kelvin (K)",
                      style: TextStyle(
                          color: widget.kisActive
                              ? Colors.white
                              : const Color.fromARGB(255, 167, 143, 186)),
                    ),
                  ),
                ),
              ],
            )));
  }
}

class ProfileButton extends StatefulWidget {
  final double widgetWidth;
  const ProfileButton({super.key, required this.widgetWidth});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/profile");
      },
      child: MenuContainer(
        widgetWidth: widget.widgetWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            ProfilePicture(size: 60),
          ],
        ),
      ),
    );
  }
}
