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
                      const Username(),
                      SizedBox(height: margins),
                    ],
                  )),
              SizedBox(height: margins),
              MenuContainer(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.place, color: Colors.white, size: 36),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 167, 143, 186)
                                .withOpacity(0.4),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Barcelona",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: margins),
              MenuContainer(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: margins / 2),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: margins),
                      const Email(),
                      SizedBox(height: margins / 2),
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
        mainTextStyle: const TextStyle(
            color: Color.fromARGB(255, 209, 201, 213), fontSize: 16),
        fieldTextStyle: const TextStyle(
            color: Color.fromARGB(255, 209, 201, 213), fontSize: 16),
        centeredText: false,
      ),
    );
  }
}
