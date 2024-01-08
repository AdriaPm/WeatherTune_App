import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailTextBox extends StatefulWidget {
  EmailTextBox({super.key});
  String email = "";
  @override
  State<EmailTextBox> createState() => _EmailTextboxState();
}

class _EmailTextboxState extends State<EmailTextBox> {
  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  Future<void> _getUserEmail() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      widget.email = user.email ?? "No email available";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.email,
            style: const TextStyle(
                color: Color.fromARGB(255, 209, 201, 213), fontSize: 16),
          ),
        ],
      ),
    );
  }
}
