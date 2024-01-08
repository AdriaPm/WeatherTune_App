import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/menu_container.dart';

class DropDownButton extends StatefulWidget {
  final dynamic child;
  final String title;
  final double widgetWidth;
  const DropDownButton(
      {super.key,
      required this.child,
      required this.widgetWidth,
      required this.title});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: MenuContainer(
          widgetWidth: widget.widgetWidth,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  selected
                      ? const Icon(Icons.keyboard_arrow_down,
                          color: Colors.white)
                      : const Icon(Icons.keyboard_arrow_right,
                          color: Colors.white)
                ],
              ),
              if (selected)
                Container(
                    padding: const EdgeInsets.fromLTRB(2, 10, 5, 5),
                    child: widget.child),
            ],
          )),
    );
  }
}
