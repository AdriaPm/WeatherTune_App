import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:weather_tune/components/login_page/profile_picture.dart';
import 'package:weather_tune/components/login_page/menu_container.dart';
import 'package:weather_tune/components/login_page/modifiable_textbox.dart';

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
                      ChangeProfilePicture(picture: ProfilePicture(size: 160)),
                      SizedBox(height: margins),
                      Username(),
                      SizedBox(height: margins),
                    ],
                  )),
              SizedBox(height: margins),
              MenuContainer(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                child: const Column(children: [
                  Text("Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Email(),
                ]),
              ),
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

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ModifiableTextbox(
        defaultText: "username",
        mainTextStyle: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        fieldTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centeredText: true,
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ModifiableTextbox(
        defaultText: "example@gmail.com",
        mainTextStyle:
            const TextStyle(color: Color.fromARGB(255, 209, 201, 213)),
        fieldTextStyle:
            const TextStyle(color: Color.fromARGB(255, 209, 201, 213)),
        centeredText: false,
      ),
    );
  }
}
