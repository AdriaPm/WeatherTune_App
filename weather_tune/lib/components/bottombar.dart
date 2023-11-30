import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBarWidget extends StatefulWidget {
  BottomBarWidget(
      {super.key,
      required this.favorites_active,
      required this.home_active,
      required this.profile_active,
      required this.search_active});

  bool home_active;
  bool favorites_active;
  bool search_active;
  bool profile_active;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  //Sign User Out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  Icon Favorite1 = const Icon(
    Icons.favorite_border_outlined,
    color: Colors.grey,
    size: 40,
  );

  Icon Favorite2 = const Icon(
    Icons.favorite,
    color: Color.fromARGB(255, 106, 0, 244),
    size: 40,
  );

  Icon Search1 = const Icon(
    Icons.search_outlined,
    color: Colors.grey,
    size: 40,
  );
  Icon Search2 = const Icon(
    Icons.search,
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
                  ? Color.fromARGB(255, 106, 0, 244)
                  : Color.fromARGB(255, 104, 104, 104),
            ),
            iconSize: 40,
            onPressed: () {
              setState(() {
                widget.home_active = !widget.home_active;
                widget.favorites_active = false;
                widget.search_active = false;
                widget.profile_active = false;
              });
            },
          ),
          IconButton(
            icon: widget.favorites_active ? Favorite2 : Favorite1,
            onPressed: () {
              setState(() {
                widget.favorites_active = !widget.favorites_active;
                widget.home_active = false;
                widget.search_active = false;
                widget.profile_active = false;
              });
              // Add your logic here
            },
          ),
          IconButton(
            icon: widget.search_active ? Search2 : Search1,
            onPressed: () {
              setState(() {
                widget.search_active = !widget.search_active;
                widget.home_active = false;
                widget.favorites_active = false;
                widget.profile_active = false;
              });
              // Add your logic here
            },
          ),
          IconButton(
              onPressed: signOut,
              icon: const Icon(
                Icons.logout,
                color: Colors.grey,
                size: 40,
              ))
        ],
      ),
    );
  }
}
