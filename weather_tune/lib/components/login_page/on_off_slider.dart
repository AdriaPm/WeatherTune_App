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
            color: const Color.fromARGB(255, 195, 135, 206).withOpacity(0.6),
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

class SliderButton extends StatelessWidget {
  final String title;
  final double widgetWidth;
  const SliderButton(
      {super.key, required this.widgetWidth, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: widgetWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurple, Color.fromARGB(255, 199, 44, 226)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const OnOffSlider(size: 28),
        ],
      ),
    );
  }
}
