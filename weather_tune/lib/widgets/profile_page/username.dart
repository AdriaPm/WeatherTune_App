import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsernameTextbox extends StatefulWidget {
  UsernameTextbox({super.key});
  String username = "";
  String userID = "";
  bool centeredText = true;
  bool clicked = false;
  @override
  State<UsernameTextbox> createState() => _UsernameTextboxState();
}

class _UsernameTextboxState extends State<UsernameTextbox> {
  @override
  void initState() {
    super.initState();
    _getUserID();
    _getUsername();
  }

  Future<void> _getUserID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      widget.userID = user.uid;
    }
  }

  Future<void> _getUsername() async {
    try {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(widget.userID)
          .get();
      var userData = user.data() as Map<String, dynamic>;
      setState(() {
        widget.username = userData['username'];
      });
    } catch (e) {
      print('Error adding username: $e');
    }
  }

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
              widget.username,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          if (widget.clicked)
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign:
                  widget.centeredText ? TextAlign.center : TextAlign.start,
              onSubmitted: (newText) {
                // Update text content when the user types in the TextField
                setState(() {
                  widget.username = newText;
                  storeUsername(widget.userID, widget.username);
                  widget.clicked = false;
                });
              },
            ),
        ],
      ),
    );
  }
}

Future storeUsername(String userID, String username) async {
  try {
    await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(userID)
        .set({'username': username});
  } catch (e) {
    print('Error storing username: $e');
  }
}
