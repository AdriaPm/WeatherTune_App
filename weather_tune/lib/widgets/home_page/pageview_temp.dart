import 'package:flutter/material.dart';

class TempInfo extends StatefulWidget {
  const TempInfo(
      {super.key,
      required this.apiinputmax,
      required this.captionrise,
      required this.imagePathrise,
      required this.apiinputmin,
      required this.captionset,
      required this.imagePathset});

  final int apiinputmax;
  final String captionrise;
  final String imagePathrise;
  final int apiinputmin;
  final String captionset;
  final String imagePathset;

  @override
  State<TempInfo> createState() => _TempInfoState();
}

class _TempInfoState extends State<TempInfo> {
  List<Color> gradientSquareColors = [
    Colors.indigo.shade900,
    Colors.indigo,
    Colors.deepPurple,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 243, 35, 35)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(
                    widget.imagePathrise,
                  ),
                  height: 80,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.apiinputmax}ºC',
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
                  height: 80,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.apiinputmin}ºC',
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
