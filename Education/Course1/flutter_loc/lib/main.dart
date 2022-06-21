import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? _positionLatiude = 0.0;
  double? _positionLongitude = 0.0;

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _positionLatiude = position.latitude;
      _positionLongitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Geolocator Example",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Geolocator'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enlem : $_positionLatiude",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                "Boylam : $_positionLongitude",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _getCurrentLocation();
                },
                child: const Text("Konum Al"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
