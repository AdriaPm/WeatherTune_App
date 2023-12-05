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
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
              ),
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
