import 'package:flutter/material.dart';

class AirConcentration extends StatefulWidget {
  const AirConcentration({super.key});

  @override
  State<AirConcentration> createState() => _AirConcentrationState();
}

class _AirConcentrationState extends State<AirConcentration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "AIR CONCENTRATION",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("Cloudiness"),
        ],
      ),
    );
  }
}
