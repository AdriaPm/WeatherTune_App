import 'package:flutter/material.dart';

class OnOffSlider extends StatefulWidget {
  final double size;
  const OnOffSlider({super.key, required this.size});

  @override
  State<OnOffSlider> createState() => _OnOffSliderState();
}

class _OnOffSliderState extends State<OnOffSlider> {
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          on = !on;
        });
      },
      child: Container(
          width: widget.size * 2,
          height: widget.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.size),
            color: const Color.fromARGB(255, 194, 156, 201).withOpacity(0.6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Align(
              alignment: on ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                  width: widget.size - 8,
                  height: widget.size - 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.size),
                    color:
                        const Color.fromARGB(255, 49, 22, 61).withOpacity(0.6),
                  )),
            ),
          )),
    );
  }
}
