import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_tutorial/sayac_model.dart';

// ignore: must_be_immutable
class IkinciSayfa extends StatelessWidget {
  IkinciSayfa({Key? key}) : super(key: key);

  var sayacModelNesne = SayacModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Observer(builder: (_) {
            return Text(
              "${sayacModelNesne.sayac}",
              style: const TextStyle(
                fontSize: 36,
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              sayacModelNesne.sayaciArttir();
            },
            child: const Text("Sayaç Arttır"),
          ),
          ElevatedButton(
            onPressed: () {
              sayacModelNesne.sayaciAzalt(1);
            },
            child: const Text("Sayaç Azalt"),
          ),
        ],
      ),
    );
  }
}
