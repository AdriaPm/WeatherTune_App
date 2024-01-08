// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePicture extends StatelessWidget {
  String? imagePath;
  double size;

  ProfilePicture({super.key, required this.size, this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage(imagePath ?? "images/profile_pictures/purple.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(size)));
  }
}

class ChangeProfilePicture extends StatefulWidget {
  String? newImagePath;
  String userID = "";
  List<String> pictures = [
    "purple.png",
    "blue.png",
    "orange.png",
    "green.png",
    "red.png"
  ];
  double pictureSize;
  bool opened = false;
  int chosen = 0;
  int min = 0;
  int max = 4;

  ChangeProfilePicture({super.key, required this.pictureSize});
  @override
  State<ChangeProfilePicture> createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
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
        try {
          widget.chosen = userData['chosenpfp'];
        } catch (e) {
          print('Error setting chosen number: $e');
        }
      });
    } catch (e) {
      print('Error finding profile picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.opened = !widget.opened;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfilePicture(
              size: widget.pictureSize,
              imagePath:
                  "images/profile_pictures/${widget.pictures[widget.chosen]}"),
          if (widget.opened) const SizedBox(height: 20),
          if (widget.opened)
            Container(
              width: MediaQuery.sizeOf(context).width - 120,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepPurple.withOpacity(0.7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int n = widget.min; n <= widget.max; n++)
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.chosen = n;
                            storeProfilePic(widget.userID, widget.chosen);
                          });
                        },
                        child: Container(
                            width: widget.chosen == n ? 45 : 30,
                            height: widget.chosen == n ? 45 : 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "images/profile_pictures/${widget.pictures[n]}"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10)))),
                ],
              ),
            )
        ],
      ),
    );
  }
}

Future storeProfilePic(String userID, int number) async {
  try {
    await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(userID)
        .update({'chosenpfp': number});
  } catch (e) {
    print('Error storing profile picture: $e');
  }
}
