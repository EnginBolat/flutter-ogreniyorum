import 'package:flutter/material.dart';
import 'package:mobx_tutorial/ikinci_sayfa.dart';
import 'package:mobx_tutorial/sayac_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var sayacModelNesne = SayacModel();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${sayacModelNesne.sayac}",
              style: const TextStyle(
                fontSize: 36,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IkinciSayfa(),
                  ),
                );
              },
              child: const Text("Geçiş Yap"),
            ),
          ],
        )),
      ),
    );
  }
}
