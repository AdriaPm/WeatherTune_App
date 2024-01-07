import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsernameTextbox extends StatefulWidget {
  UsernameTextbox({super.key});
  String defaultText = "username";
  final TextStyle mainTextStyle = const TextStyle(
      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
  final TextStyle fieldTextStyle =
      const TextStyle(color: Colors.white, fontSize: 20);
  bool centeredText = true;
  bool clicked = false;
  @override
  State<UsernameTextbox> createState() => _UsernameTextboxState();
}

class _UsernameTextboxState extends State<UsernameTextbox> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
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
                  addUsername(widget.defaultText);
                });
              },
            ),
        ],
      ),
    );
  }
}

Future addUsername(String username) async {
  try {
    await FirebaseFirestore.instance
        .collection('UserInfo')
        .add({'Username': username});
  } catch (e) {
    print('Error adding username: $e');
  }
}
