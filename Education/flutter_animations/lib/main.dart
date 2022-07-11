import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

//with kısmı ile vsync veriyoruz.
class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController animasyonKontrol;
  late Animation<double> alphaAnimasyonDegerleri;
  late Animation<double> scaleAnimasyonDegerleri;
  late Animation<double> rotateAnimasyonDegerleri;
  late Animation<double> translateAnimasyonDegerleri;


  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    alphaAnimasyonDegerleri =
        Tween(begin: 1.0, end: 0.0).animate(animasyonKontrol)
          ..addListener(() {
            setState(() {});
          });
    scaleAnimasyonDegerleri =
        Tween(begin: 128.0, end: 50.0).animate(animasyonKontrol)
          ..addListener(() {
            setState(() {});
          });
          rotateAnimasyonDegerleri =
        Tween(begin: 0.0, end: pi/2).animate(animasyonKontrol)
          ..addListener(() {
            setState(() {});
          });
          translateAnimasyonDegerleri =
        Tween(begin: 0.0, end: -50.0).animate(animasyonKontrol)
          ..addListener(() {
            setState(() {});
          });
        
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation App',
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.wb_cloudy,
              size: 128,
              color: Colors.white,
            ),
            Transform.translate(
              offset: Offset(translateAnimasyonDegerleri.value,0.0),
              child: const Text(
                "Hava Durumu",
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  animasyonKontrol.forward();
                },
                child: const Text(
                  "BAŞLAT",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
