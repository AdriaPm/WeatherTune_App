import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//class RadarPage extends StatefulWidget {
  
//  const RadarPage({super.key});

//  @override
//  State<RadarPage> createState() => _RadarPageState();
//}

class MapSample extends StatefulWidget{
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 4,
  );


  @override
  Widget build(BuildContext context) {
    
    Set<TileOverlay> _tileOverLays = {};

    _initTiles() async{

      final String overlayId = DateTime.now().millisecondsSinceEpoch.toString();

      final _tileOverLays = TileOverlay(
        tileOverlayId: TileOverlayId(overlayId),
        //tileProvider: ForecastTileProvide()
        );
      setState(() {
       // _tileOverLays = {tileOverlay};
      });
    }
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _initTiles();
        },
        tileOverlays: _tileOverLays,
      ),
    );
  }
}

//class ForecastTileProvide implements TileProvider {

//  @override
//  Future<Tile> getTile(int x, int, y, int? zoom) async {
//    Uint8List tileBytes = Uint8List(0);
//    return Tile(256, 256, tileBytes);
//  }

//}