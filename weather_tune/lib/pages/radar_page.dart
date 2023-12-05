import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  GoogleMapController? _controller;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 4,
  );
  
  DateTime _forecastDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    
    Set<TileOverlay> _tileOverLays = {};

    _initTiles(DateTime dateTime) async{

      final String overlayId = dateTime.millisecondsSinceEpoch.toString();

      final tileOverLay = TileOverlay(
        tileOverlayId: TileOverlayId(overlayId),
        tileProvider: ForecastTileProvide(
          //mapType: 'SD0',
          mapType: 'PR0',
          opacity: 0.9,
          dateTime: dateTime,
          )
        );
      setState(() {
        _tileOverLays = {tileOverLay};
      });
    }

    _changeDate(duration){
      setState(() {
      _forecastDate = 
        _forecastDate.add(duration);
      });
      _initTiles(_forecastDate);
    }

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller = controller;
              });
              _initTiles(_forecastDate);
            },
            tileOverlays: _tileOverLays,
          ),
          Positioned(
            bottom: 30,
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: _controller == null ? null : (){
                        setState(() {
                          _changeDate(const Duration(hours: -3));
                        });
                        
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
              Positioned(
                right: 30,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: _controller == null ? null : (){
                    setState(() {
                      _changeDate(const Duration(hours: 3));
                    });
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              )
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastTileProvide implements TileProvider {
  final String mapType;
  final double opacity;
  final DateTime dateTime;
  int tileSize = 256;

  ForecastTileProvide({
    required this.mapType,
    required this. opacity,
    required this.dateTime,
    });
 
  @override
  Future<Tile> getTile (int x, int y, int? zoom) async {
    Uint8List tileBytes = Uint8List(0);
    final date = dateTime.millisecondsSinceEpoch ~/ 1000;

    try{
      final url = "http://maps.openweathermap.org/maps/2.0/weather/$mapType/$zoom/$x/$y?date=$date&opacity=$opacity&appid=9521fffe8c47941cbe4fd2102ef11043";
      final uri = Uri.parse(url);
      final imageData = await NetworkAssetBundle(uri).load("");
      tileBytes =imageData.buffer.asUint8List();
    } catch(e){
      print(e.toString());
    }
      return Tile(tileSize, tileSize, tileBytes);
  }
}
