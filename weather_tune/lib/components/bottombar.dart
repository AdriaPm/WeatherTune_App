// ignore_for_file: non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBarWidget extends StatefulWidget {
  BottomBarWidget(
      {super.key,
      required this.home_active,
      required this.favorites_active,
      required this.radar_active,
      required this.settings_active});

  bool home_active;
  bool favorites_active;
  bool radar_active;
  bool settings_active;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  //Sign User Out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: widget.home_active
                  ? const Color.fromARGB(255, 106, 0, 244)
                  : const Color.fromARGB(255, 104, 104, 104),
            ),
            iconSize: 40,
            onPressed: () {
              setState(() {
                widget.home_active = true;
                widget.favorites_active = false;
                widget.radar_active = false;
                widget.settings_active = false;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.list_rounded,
              color: widget.favorites_active
                  ? const Color.fromARGB(255, 106, 0, 244)
                  : const Color.fromARGB(255, 104, 104, 104),
            ),
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushNamed("/favorites");
              setState(() {
                widget.favorites_active = !widget.favorites_active;
                widget.radar_active = false;
                widget.settings_active = false;
                widget.favorites_active = !widget.favorites_active;
                widget.home_active = true;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.radar_rounded,
              color: widget.radar_active
                  ? const Color.fromARGB(255, 106, 0, 244)
                  : const Color.fromARGB(255, 104, 104, 104),
            ),
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushNamed("/radar");
              setState(() {
                widget.radar_active = !widget.radar_active;
                widget.favorites_active = false;
                widget.settings_active = false;
                widget.radar_active = !widget.radar_active;
                widget.home_active = true;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: widget.settings_active
                  ? const Color.fromARGB(255, 106, 0, 244)
                  : const Color.fromARGB(255, 104, 104, 104),
            ),
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
              setState(() {
                widget.settings_active = !widget.settings_active;
                widget.radar_active = false;
                widget.favorites_active = false;
                widget.settings_active = !widget.settings_active;
                widget.home_active = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
