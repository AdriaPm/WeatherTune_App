import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SunInfo extends StatefulWidget {
  const SunInfo(
      {super.key,
      required this.apiinputrise,
      required this.captionrise,
      required this.imagePathrise,
      required this.apiinputset,
      required this.captionset,
      required this.imagePathset});

  final DateTime apiinputrise;
  final String captionrise;
  final String imagePathrise;
  final DateTime apiinputset;
  final String captionset;
  final String imagePathset;

  @override
  State<SunInfo> createState() => _SunInfoState();
}

class _SunInfoState extends State<SunInfo> {
  List<Color> gradientSquareColors = [
    Colors.indigo.shade900,
    Colors.indigo,
    Colors.deepPurple,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(60)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    widget.imagePathrise,
                  ),
                  height: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat().add_jm().format(widget.apiinputrise),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.captionrise,
                      softWrap: true,
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(widget.imagePathset),
                  height: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat().add_jm().format(widget.apiinputset),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.captionset,
                      softWrap: true,
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
