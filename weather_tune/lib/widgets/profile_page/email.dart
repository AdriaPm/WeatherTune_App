import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmailTextBox extends StatefulWidget {
  EmailTextBox({super.key});
  String defaultText = "example@gmail.com";
  final TextStyle mainTextStyle =
      const TextStyle(color: Color.fromARGB(255, 209, 201, 213), fontSize: 16);
  final TextStyle fieldTextStyle =
      const TextStyle(color: Color.fromARGB(255, 209, 201, 213), fontSize: 16);
  bool centeredText = false;
  bool clicked = false;
  @override
  State<EmailTextBox> createState() => _EmailTextboxState();
}

class _EmailTextboxState extends State<EmailTextBox> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
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
              textAlign:
                  widget.centeredText ? TextAlign.center : TextAlign.start,
              onSubmitted: (newText) {
                // Update text content when the user types in the TextField
                setState(() {
                  widget.defaultText = newText;
                  addEmail(widget.defaultText);
                });
              },
            ),
        ],
      ),
    );
  }
}

Future addEmail(String email) async {
  try {
    await FirebaseFirestore.instance
        .collection('UserInfo')
        .add({'email': email});
  } catch (e) {
    print('Error adding email: $e');
  }
}
