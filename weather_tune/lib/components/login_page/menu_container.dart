import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  final dynamic child;
  final double widgetWidth;
  const MenuContainer(
      {super.key, required this.child, required this.widgetWidth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(10),
          width: widgetWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Color.fromARGB(255, 199, 44, 226)],
            ),
          ),
          child: child),
    );
  }
}
