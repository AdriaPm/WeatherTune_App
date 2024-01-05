import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:weather_tune/components/login_page/profile_picture.dart';
import 'package:weather_tune/components/login_page/menu_container.dart';

class ProfilePage extends StatelessWidget {
  final double margins = 10;
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 66, 9, 56),
              Color.fromARGB(255, 24, 5, 53)
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: margins * 2),
              const Text("Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: margins * 2),
              MenuContainer(
                  widgetWidth: MediaQuery.sizeOf(context).width - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: margins),
                      ChangeProfilePicture(picture: ProfilePicture(size: 80)),
                      SizedBox(height: margins),
                      Username(),
                      SizedBox(height: margins),
                    ],
                  )),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Privacy Settings",
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "English",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Terms of Service",
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "English",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Support",
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "English",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: margins),
            ],
          ),
        ),
      ),
    );
  }
}

class Username extends StatefulWidget {
  Username({super.key});
  String? username;

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/profile");
        },
        child: Text(widget.username ?? "Username",
            style: const TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
