import 'package:flutter/material.dart';

class ModifiableTextbox extends StatefulWidget {
  ModifiableTextbox(
      {super.key,
      required this.defaultText,
      required this.mainTextStyle,
      required this.fieldTextStyle,
      required this.centeredText});
  String defaultText;
  final TextStyle mainTextStyle;
  final TextStyle fieldTextStyle;
  bool centeredText = false;
  bool clicked = false;
  @override
  State<ModifiableTextbox> createState() => _ModifiableTextboxState();
}

class _ModifiableTextboxState extends State<ModifiableTextbox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.clicked = !widget.clicked;
            });
          },
          child: Text(
            widget.defaultText,
            style: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        if (widget.clicked) const SizedBox(height: 20),
        if (widget.clicked)
          TextField(
            style: const TextStyle(color: Colors.white),
            textAlign: widget.centeredText ? TextAlign.center : TextAlign.start,
            onChanged: (newText) {
              // Update text content when the user types in the TextField
              setState(() {
                widget.defaultText = newText;
              });
            },
          ),
      ],
    );
  }
}
