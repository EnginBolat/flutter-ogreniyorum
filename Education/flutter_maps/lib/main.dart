import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/konum.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? enlem;
  double? boylam;

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      enlem = position.latitude;
      boylam = position.longitude;
    });
  }

  Completer<GoogleMapController> haritaKontrol = Completer();

  var baslangicKonum = const CameraPosition(
    target: LatLng(38.7412482, 26.1844276),
    zoom: 4,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Google Maps"),
          centerTitle: true,
        ),
        body: Konum(),
      ),
    );
  }
}
