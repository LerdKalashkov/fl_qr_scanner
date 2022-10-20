import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;

    final CameraPosition initialUbication =
        CameraPosition(target: scan.getLatLng(), zoom: 17.5, tilt: 50);

    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
        markerId: const MarkerId('geo-location'), position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(title: const Text('Maps'), actions: [
        IconButton(
            icon: const Icon(
              Icons.pin_drop_outlined,
              color: Colors.white,
            ),
            onPressed: (() async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: scan.getLatLng(), zoom: 17.5, tilt: 50)));
            }))
      ]),
      body: GoogleMap(
        markers: markers,
        mapType: mapType,
        initialCameraPosition: initialUbication,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.terrain;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
        child: const Icon(Icons.layers),
      ),
    );
  }
}
