import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';

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
