import 'package:film_app/models/Kategoriler.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

import 'package:film_app/models/film_model.dart.dart';
import 'package:film_app/view/filmler_sayfasi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var refKategoriler = FirebaseDatabase.instance.ref().child("kategoriler");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KATEGORİ SAYFASI'),
          centerTitle: true,
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refKategoriler.onValue,
          builder: (context, event) {
            if (event.hasData) {
              var kategorilerListesi = <Kategoriler>[];
              var gelenDegerler = event.data!.snapshot.value as dynamic;
              if (gelenDegerler != null) {
                gelenDegerler.forEach((key, nesne) {
                  var gelenKategori = Kategoriler.fromJson(key, nesne);
                  kategorilerListesi.add(gelenKategori);
                });
              }
              return ListView.builder(
                itemCount: kategorilerListesi.length,
                itemBuilder: (context, index) {
                  var kategori = kategorilerListesi[index];
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FilmlerSayfasi(kategori: kategori),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 120,
                        child: Card(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              kategori.kategori_ad,
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Film Kagetorisi Bulunamadı."));
            }
          },
        ),
      ),
    );
  }
}
