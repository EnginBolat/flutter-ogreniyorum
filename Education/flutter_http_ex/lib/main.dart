import 'package:flutter/material.dart';
import 'package:flutter_http_ex/Kisiler.dart';
import 'package:flutter_http_ex/KisilerCevap.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var listeUzunluk;
  var liste;

  List<Kisiler> parseKisilerCevap(String cevap) {
    //Uzun Hali

    // var jsonVeri = json.decode(cevap);
    // var kisilerCevap=KisilerCevap.fromJson(jsonVeri);
    // List<Kisiler> kisilerListesi = kisilerCevap.kisiListesi;

    //Kısa hali
    return KisilerCevap.fromJson(jsonDecode(cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> tumKisiler() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<List<Kisiler>> kisilerAra(String aramaKelimesi) async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php");
    var veri = {"kisi_ad": aramaKelimesi};
    var cevap = await http.post(url, body: veri);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisiSil(int kisi_id) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var veri = {"kisi_id": kisi_id.toString()};
    var cevap = await http.post(url, body: veri);
    // ignore: avoid_print
    print("Silme Cevap:${cevap.body}");
  }

  Future<void> kisiEkle(String kisi_ad, String kisi_tel) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await http.post(url, body: veri);
    // ignore: avoid_print
    print("Kayıt Cevap:${cevap.body}");
  }

  Future<void> kisiGuncelle(
      int kisi_id, String kisi_ad, String kisi_tel) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    var veri = {
      "kisi_id": kisi_id.toString(),
      "kisi_ad": kisi_ad,
      "kisi_tel": kisi_tel
    };
    var cevap = await http.post(url, body: veri);
    // ignore: avoid_print
    print("Güncelleme Cevap:${cevap.body}");
  }

  Future<void> kisileriGoster() async {
    liste = await kisilerAra("bur");
    listeUzunluk = liste.length;
    for (var kisi in liste) {
      // ignore: avoid_print
      print("**********");
      // ignore: avoid_print
      print("Kisi Id:${kisi.kisi_id}");
      // ignore: avoid_print
      print("Kisi Ad:${kisi.kisi_ad}");
      // ignore: avoid_print
      print("Kisi Tel:${kisi.kisi_tel}");
    }
  }

  @override
  void initState() {
    super.initState();
    // kisileriGoster();
    // kisiSil(4852);
    // kisiEkle("eng", "2224");
    // kisiGuncelle(4847, "engin", "2224");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HTTP APP',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter HTTP'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Kisiler>>(
          future: tumKisiler(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kisiListesi = snapshot.data;
              return ListView.builder(
                itemCount: kisiListesi!.length,
                itemBuilder: (context, index) {
                  var kisi = kisiListesi[index];
                  return SizedBox(
                    height: 80,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Kişi Id: ${kisi.kisi_id}",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Kişi Adı: ${kisi.kisi_ad}",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Kişi Tel: ${kisi.kisi_tel}",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
