import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapPosition markerPosition = MapPosition (center: LatLng(36.2972, 59.6067));
  MapController mapController = MapController();


  @override
  Widget build(BuildContext context) {

    return FlutterMap(
      options: MapOptions(
        center: markerPosition.center,
        onPositionChanged: (position, hasGesture) {
          setState(() {
            markerPosition =  position;
          });
        },
        zoom: 15,
      ),
      mapController: MapController(),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: markerPosition.center ?? LatLng(36.2972, 59.6067),
              width: 80,
              height: 80,
              builder: (context) => Image.asset('assets/images/avatar.JPG'),
            ),
          ],
        ),
      ],
    );
  }
}
