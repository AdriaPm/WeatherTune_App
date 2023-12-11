// ignore_for_file: non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBarWidget extends StatefulWidget {
  BottomBarWidget(
      {super.key,
      required this.favorites_active,
      required this.home_active,
      required this.profile_active,
      required this.search_active,
      required this.settings_active});

  bool home_active;
  bool favorites_active;
  bool search_active;
  bool profile_active;
  bool settings_active;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  //Sign User Out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  Icon List1 = const Icon(
    Icons.list_rounded,
    color: Colors.grey,
    size: 40,
  );

  Icon List2 = const Icon(
    Icons.list_rounded,
    color: Color.fromARGB(255, 106, 0, 244),
    size: 40,
  );

  Icon Settings1 = const Icon(
    Icons.settings,
    color: Colors.grey,
    size: 40,
  );

  Icon Settings2 = const Icon(
    Icons.settings,
    color: Color.fromARGB(255, 106, 0, 244),
    size: 40,
  );

  Icon Radar1 = const Icon(
    Icons.radar_outlined,
    color: Colors.grey,
    size: 40,
  );
  Icon Radar2 = const Icon(
    Icons.radar_rounded,
    color: Color.fromARGB(255, 106, 0, 244),
    size: 40,
  );

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
                widget.home_active = !widget.home_active;
                widget.favorites_active = false;
                widget.search_active = false;
                widget.profile_active = false;
                widget.settings_active = false;
              });
            },
          ),
          IconButton(
            iconSize: 40,
            icon: widget.favorites_active ? List2 : List1,
            onPressed: () {
              setState(() {
                widget.favorites_active = !widget.favorites_active;
                widget.home_active = false;
                widget.search_active = false;
                widget.profile_active = false;
                widget.settings_active = false;
              });
              // Add your logic here
            },
          ),
          IconButton(
            iconSize: 40,
            icon: widget.search_active ? Radar2 : Radar1,
            onPressed: () {
              Navigator.of(context).pushNamed("/radar");
              setState(() {
                widget.search_active = !widget.search_active;
                widget.home_active = false;
                widget.favorites_active = false;
                widget.profile_active = false;
                widget.settings_active = false;
              });
              // Add your logic here
            },
          ),
          IconButton(
            iconSize: 40,
            icon: widget.settings_active ? Settings2 : Settings1,
            onPressed: () {
              setState(() {
                widget.settings_active = !widget.settings_active;
                widget.search_active = false;
                widget.home_active = false;
                widget.favorites_active = false;
                widget.profile_active = false;
              });
            },
          ),
          //IconButton(
          //  onPressed: signOut,
          //icon: const Icon(
          //Icons.logout,
          //color: Colors.grey,
          //size: 40,
          //))
        ],
      ),
    );
  }
}
