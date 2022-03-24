import 'package:film_app/models/kategori_model.dart';
import 'package:film_app/models/kategoricevap_model.dart';
import 'package:film_app/view/filmler_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Kategori> kategoriParse(String cevap) {
    return KategoriCevap.fromJson(json.decode(cevap)).kategoriListesi;
  }

  Future<List<Kategori>> tumKategoriler() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/filmler/tum_kategoriler.php");
    var cevap = await http.get(url);
    return kategoriParse(cevap.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumKategoriler();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KATEGORİ SAYFASI'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Kategori>>(
          future: tumKategoriler(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kategoriListesi = snapshot.data;
              return ListView.builder(
                itemCount: kategoriListesi!.length,
                itemBuilder: (context, index) {
                  var kategori = kategoriListesi[index];
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
