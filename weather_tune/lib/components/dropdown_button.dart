import 'package:flutter/material.dart';

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
    return Container(
        padding: const EdgeInsets.all(5),
        width: widget.widgetWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                selected
                    ? const Icon(Icons.keyboard_arrow_right)
                    : const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            if (selected) widget.child,
          ],
        ));
  }
}
