import 'package:flutter/material.dart';

class MyUbication extends StatelessWidget {
  const MyUbication({
    super.key,
    required this.areaName,
    required this.maxTemp,
    required this.minTemp,
  });

  final String areaName;
  final int maxTemp;
  final int minTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "My ubication:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          '📍 $areaName',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 150,
          endIndent: 150,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Max: $maxTempºC',
              style: TextStyle(
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              'Min: $minTempºC',
              style: TextStyle(
                color: Colors.grey.shade400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
