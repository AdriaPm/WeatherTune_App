import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RadarPage extends StatefulWidget {
  const RadarPage({super.key});

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(1.35, 103.8),
    zoom: 4,
  );

  @override
  Widget build(BuildContext context) {
    var markers = {
      const Marker(markerId: MarkerId('Paris'), position: LatLng(48.85, 2.35)),
      Marker(
          markerId: const MarkerId('New York'),
          position: const LatLng(48.85, 2.35),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)),
      Marker(
          markerId: const MarkerId('London'),
          position: const LatLng(40.7, -74),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)),
      Marker(
          markerId: const MarkerId('Tokio'),
          position: const LatLng(35.69, 139.69),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueYellow)),
      Marker(
          markerId: const MarkerId('Sydney'),
          position: const LatLng(-33.86, 151.21),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange)),
      Marker(
          markerId: const MarkerId('Berlin'),
          position: const LatLng(52.52, 13.38),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet)),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: const Color.fromARGB(207, 255, 255, 255),
        toolbarHeight: 50,
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),
    );
  }
}
