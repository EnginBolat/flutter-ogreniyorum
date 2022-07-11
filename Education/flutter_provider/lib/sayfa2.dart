import 'package:flutter/material.dart';
import 'package:flutter_provider/sayac_model.dart';
import 'package:provider/provider.dart';

class IkinciSayfa extends StatelessWidget {
  const IkinciSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İkinci Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<SayacModel>(builder: (context, sayacModelNesne, child) {
              return Text(
                "${sayacModelNesne.sayaciOku()}",
                style: const TextStyle(fontSize: 36),
              );
            }),
            Consumer<SayacModel>(builder: (context, sayacModelNesne, child) {
              return ElevatedButton(
                child: const Text("Sayaç Arttır"),
                onPressed: () {
                  sayacModelNesne.sayaciArttir();
                },
              );
            }),
            Consumer<SayacModel>(builder: (context, sayacModelNesne, child) {
              return ElevatedButton(
                child: const Text("Sayaç Azalt"),
                onPressed: () {
                  sayacModelNesne.sayaciAzalt(1);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
