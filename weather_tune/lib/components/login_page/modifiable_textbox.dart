// ignore_for_file: must_be_immutable

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
      mainAxisAlignment: widget.centeredText
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.clicked = !widget.clicked;
            });
          },
          child: Text(
            widget.defaultText,
            style: widget.mainTextStyle,
          ),
        ),
        if (widget.clicked)
          TextField(
            style: widget.fieldTextStyle,
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
