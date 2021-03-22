import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition _iniPosition = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _iniPosition,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
    );
  }
}
