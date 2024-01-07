// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

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
              image: AssetImage(imagePath ?? "images/DarkModeDefault.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(size)));
  }
}

class ChangeProfilePicture extends StatefulWidget {
  String? newImagePath;
  ProfilePicture picture;

  ChangeProfilePicture({super.key, required this.picture});
  @override
  State<ChangeProfilePicture> createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: widget.picture,
    );
  }
}
