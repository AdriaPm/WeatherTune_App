import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:weather_tune/components/login_page/on_off_slider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
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
              SizedBox(height: margins * 2),
              LanguageSelector(english_active: true, spanish_active: false),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Alerts",
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: OnOffSlider(size: 30),
                ),
              ),
              SizedBox(height: margins),
              UnitSelector(c_active: true, f_active: false, k_active: false),
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
      {super.key, required this.english_active, required this.spanish_active});
  bool english_active;
  bool spanish_active;

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
                        widget.spanish_active = false;
                        widget.english_active = true;
                      });
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                          color: widget.english_active
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
                        widget.spanish_active = true;
                        widget.english_active = false;
                      });
                    },
                    child: Text(
                      "Spanish",
                      style: TextStyle(
                          color: widget.spanish_active
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
      required this.f_active,
      required this.c_active,
      required this.k_active});
  bool f_active;
  bool c_active;
  bool k_active;

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
                        widget.f_active = true;
                        widget.c_active = false;
                        widget.k_active = false;
                      });
                    },
                    child: Text(
                      "Fahrenheit (Fº)",
                      style: TextStyle(
                          color: widget.f_active
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
                        widget.f_active = false;
                        widget.c_active = true;
                        widget.k_active = false;
                      });
                    },
                    child: Text(
                      "Celsius (Cº)",
                      style: TextStyle(
                          color: widget.c_active
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
                        widget.f_active = false;
                        widget.c_active = false;
                        widget.k_active = true;
                      });
                    },
                    child: Text(
                      "Kelvin (K)",
                      style: TextStyle(
                          color: widget.k_active
                              ? Colors.white
                              : const Color.fromARGB(255, 167, 143, 186)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
