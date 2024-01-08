import 'package:flutter/material.dart';
import 'package:weather_tune/widgets/profile_page/profile_picture.dart';
import 'package:weather_tune/components/login_page/menu_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class ProfileButton extends StatefulWidget {
  final double widgetWidth;
  String userID = "";
  List<String> pictures = [
    "purple.png",
    "blue.png",
    "orange.png",
    "green.png",
    "red.png"
  ];
  int chosen = 0;
  ProfileButton({super.key, required this.widgetWidth});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  void initState() {
    super.initState();
    _getUserID();
    _getProfilePic();
  }

  Future<void> _getUserID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      widget.userID = user.uid;
    }
  }

  Future<void> _getProfilePic() async {
    try {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(widget.userID)
          .get();
      var userData = user.data() as Map<String, dynamic>;
      setState(() {
        widget.chosen = userData['chosenpfp'];
      });
    } catch (e) {
      print('Error finding profile picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed("/profile");
      },
      child: MenuContainer(
        widgetWidth: widget.widgetWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            ProfilePicture(
              imagePath:
                  "images/profile_pictures/${widget.pictures[widget.chosen]}",
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
