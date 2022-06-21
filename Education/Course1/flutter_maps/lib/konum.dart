import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Konum extends StatefulWidget {
  const Konum({Key? key}) : super(key: key);

  @override
  State<Konum> createState() => _KonumState();
}

class _KonumState extends State<Konum> {
  double enlem = 0.0;
  double boylam = 0.0;
  List<Marker> isaretler = <Marker>[];

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

  Future<void> konumaGit() async {
    final GoogleMapController controller = await haritaKontrol.future;

    var gidilecekIsaret = Marker(
      markerId: const MarkerId("Id"),
      position: LatLng(enlem, boylam),
      infoWindow: const InfoWindow(title: "İstanbul", snippet: "Evim"),
    );

    setState(() {
      isaretler.add(gidilecekIsaret);
    });

    var gidilecekKonum =
        // const CameraPosition(target: LatLng(41.0039663, 28.4517462), zoom: 8);
        CameraPosition(target: LatLng(enlem, boylam), zoom: 15);

    controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekKonum));
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1,
            child: GoogleMap(
              initialCameraPosition: baslangicKonum,
              mapType: MapType.normal,
              markers: Set<Marker>.of(isaretler),
              onMapCreated: (GoogleMapController controller) {
                haritaKontrol.complete(controller);
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                konumaGit();
              },
              child: const Text("Konuma Git"))
        ],
      ),
    );
  }
}
