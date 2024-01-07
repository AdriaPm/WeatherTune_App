import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/profile_picture.dart';
import 'package:weather_tune/components/login_page/menu_container.dart';

class ProfileButton extends StatefulWidget {
  final double widgetWidth;
  const ProfileButton({super.key, required this.widgetWidth});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            ProfilePicture(size: 60),
          ],
        ),
      ),
    );
  }
}
