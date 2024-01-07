import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';

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
