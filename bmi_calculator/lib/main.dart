import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        ),
        body: const HomePageBody(),
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final boyController = TextEditingController();
  final kiloController = TextEditingController();
  double bmi = 0;

  void _bmiHesapla() {
    double boy = double.parse(boyController.text);
    final kilo = int.parse(kiloController.text);
    print(boy);
    print(kilo);
    if(boy>0 && kilo > 0){
      bmi = (kilo/(boy*boy));
      print(bmi);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(33, 33, 33, 1),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: kiloController,
              decoration: const InputDecoration(
                hintText: "Kilo",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: boyController,
              decoration: const InputDecoration(
                  hintText: "Boy",
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2.0))),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 300, height: 50),
              child: ElevatedButton(
                onPressed: _bmiHesapla,
                child: const Text('Hesapla'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // <-- Radius
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
