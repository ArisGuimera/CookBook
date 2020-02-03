import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  CameraPosition _initialPosition = CameraPosition(target: LatLng(40.4351056, -3.7537049));
  Completer<GoogleMapController> _controller = Completer();
  final double _zoom = 13;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _goToMadrid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
            ),
          ],
        ));
  }

  Future<void> _goToMadrid() async {
    double lat = 40.4351056;
    double long = -3.7537049;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));

  }
}
