import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_ex/kisiler_model.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler_tablo");

  Future<void> kisiEkle() async {
    var bilgi = HashMap<String, dynamic>();
    bilgi["kisi_ad"] = "Ece";
    bilgi["kisi_yas"] = 30;
    refKisiler.push().set(bilgi);
    // ignore: avoid_print
    print("Veri Eklendi");
  }

  Future<void> kisiSil() async {
    refKisiler.child("-MyktrS1ms4WfibN4NST").remove();
    // ignore: avoid_print
    print("Veri Silindi");
  }

  Future<void> kisiGuncelle() async {
    var guncelBilgi = HashMap<String, dynamic>();
    guncelBilgi["kisi_ad"] = "Ece";
    guncelBilgi["kisi_yas"] = 22;
    refKisiler.child("-MykuA-EbeWwjGpw1bVy").update(guncelBilgi);
    // ignore: avoid_print
    print("Veri Güncellendi");
  }

  Future<void> tumKisiler() async {
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          var gelenKisi = Kisiler.fromJson(nesne);

          // ignore: avoid_print
          print("****************");
          // ignore: avoid_print
          print("Kişi key: ${key.toString()}");
          // ignore: avoid_print
          print("Kişi Ad: ${gelenKisi.kisi_ad}");
          // ignore: avoid_print
          print("Kişi Yaş: ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  Future<void> tumKisilerManuel() async {
    refKisiler.once().then((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          var gelenKisi = Kisiler.fromJson(nesne);

          // ignore: avoid_print
          print("****************");
          // ignore: avoid_print
          print("Kişi key: ${key.toString()}");
          // ignore: avoid_print
          print("Kişi Ad: ${gelenKisi.kisi_ad}");
          // ignore: avoid_print
          print("Kişi Yaş: ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  Future<void> tumKisilerIsimSorgu() async {
    var sorgu = refKisiler.orderByChild("kisi_ad").equalTo(adController.text);

    sorgu.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          var gelenKisi = Kisiler.fromJson(nesne);

          // ignore: avoid_print
          print("****************");
          // ignore: avoid_print
          print("Kişi key: ${key.toString()}");
          // ignore: avoid_print
          print("Kişi Ad: ${gelenKisi.kisi_ad}");
          // ignore: avoid_print
          print("Kişi Yaş: ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  Future<void> ilkIkiVeri() async {
    var sorgu = refKisiler.limitToFirst(1);
    // var sorgu = refKisiler.limitToLast(1);


    sorgu.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          var gelenKisi = Kisiler.fromJson(nesne);

          // ignore: avoid_print
          print("****************");
          // ignore: avoid_print
          print("Kişi key: ${key.toString()}");
          // ignore: avoid_print
          print("Kişi Ad: ${gelenKisi.kisi_ad}");
          // ignore: avoid_print
          print("Kişi Yaş: ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  Future<void> degerAraligi() async {
    var sorgu = refKisiler.orderByChild("kisi_yas").startAt(18).endAt(20);
    // var sorgu = refKisiler.limitToLast(1);


    sorgu.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          var gelenKisi = Kisiler.fromJson(nesne);

          // ignore: avoid_print
          print("****************");
          // ignore: avoid_print
          print("Kişi key: ${key.toString()}");
          // ignore: avoid_print
          print("Kişi Ad: ${gelenKisi.kisi_ad}");
          // ignore: avoid_print
          print("Kişi Yaş: ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // kisiEkle();
    // kisiSil();
    // kisiGuncelle();
    // tumKisiler();
    // tumKisilerManuel();
    // tumKisilerIsimSorgu();
    // ilkIkiVeri();
    degerAraligi();
  }

  var adController = TextEditingController();
  String labelMesaj = "Kişi Göster";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: adController,
                  decoration: InputDecoration(
                    hintText: "Adınızı Giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    tumKisilerIsimSorgu();
                  },
                  child: Text(labelMesaj),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
