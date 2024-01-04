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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(size)),
        child: Image(
            image: AssetImage(imagePath ?? "assets/images/DarkModeDefault.png"),
            fit: BoxFit.cover));
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
