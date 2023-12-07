import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  final dynamic child;
  final String title;
  final double widgetWidth;
  const DropDownButton(
      {super.key,
      required this.child,
      required this.widgetWidth,
      required this.title});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          width: widget.widgetWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Color.fromARGB(255, 199, 44, 226)],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  selected
                      ? const Icon(Icons.keyboard_arrow_down,
                          color: Colors.white)
                      : const Icon(Icons.keyboard_arrow_right,
                          color: Colors.white)
                ],
              ),
              if (selected)
                Container(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                    child: widget.child),
            ],
          )),
    );
  }
}
