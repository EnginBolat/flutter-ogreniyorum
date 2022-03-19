import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_practice/models/film_model.dart';
import 'package:json_practice/models/filmler_cevap.dart';
import 'package:json_practice/models/kategori_model.dart';
import 'package:json_practice/models/kisi_model.dart';
import 'package:json_practice/models/kisilercevap_model.dart';
import 'package:json_practice/models/mesaj_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void mesajParse() {
    var strVeri = '{"mesajlar" : {"mesajKod" : 1,"mesajIcerik" : "başarılı"} }';
    var jsonVeri = json.decode(strVeri);
    var jsonNsene = jsonVeri["mesajlar"];

    var mesaj = Mesajlar.jromJson(jsonNsene);

    // ignore: avoid_print
    print("Mesaj Kod: ${mesaj.mesajKod}");
    // ignore: avoid_print
    print("Mesaj İçerik: ${mesaj.mesajIcerik}");
  }

  void kisilerParse() {
    String strVeri = '''{"kisiler" :[
      {
        "kisiId":"1",
        "kisiAd":"Ahmet",
        "kisiTel":"132123"
      },
      {
        "kisiId":"2",
        "kisiAd":"Mehmet",
        "kisiTel":"156415"
      }
      ]}''';

    var jsonVeri = json.decode(strVeri);

    var jsonArray = jsonVeri["kisiler"] as List;

    List<Kisiler> kisilistesi = jsonArray
        .map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi))
        .toList();

    for (var kisi in kisilistesi) {
      // ignore: avoid_print
      print("**************");
      // ignore: avoid_print
      print("Kisi Id:${kisi.kisiId}");
      // ignore: avoid_print
      print("Kisi Ad:${kisi.kisiAd}");
      // ignore: avoid_print
      print("Kisi Tel:${kisi.kisiTel}");
    }
  }

  void kisilerCevapParse() {
    String strVeri = '''{
      "success":1,
      "kisiler" :[
      {
        "kisiId":"1",
        "kisiAd":"Ahmet",
        "kisiTel":"132123"
      },
      {
        "kisiId":"2",
        "kisiAd":"Mehmet",
        "kisiTel":"156415"
      }
      ]}''';

    var jsonVeri = json.decode(strVeri);

    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);

    // ignore: avoid_print
    print("Success: ${kisilerCevap.success}");

    List<Kisiler> kisilerListesi = kisilerCevap.kisiListesi;

    for (var kisi in kisilerListesi) {
      // ignore: avoid_print
      print("**************");
      // ignore: avoid_print
      print("Kisi Id:${kisi.kisiId}");
      // ignore: avoid_print
      print("Kisi Ad:${kisi.kisiAd}");
      // ignore: avoid_print
      print("Kisi Tel:${kisi.kisiTel}");
    }
  }

  void filmlerCevapParse() {
    String strVeri = '''{
      "success":1,
      "filmler" :[
      {
        "filmId":"1",
        "filmAd":"Interstellar",
        "filmResim":"interstellar.jpeg",
        "filmYil":"2015",
        "kategori" : 
        {
          "kategoriId":"4",
          "kategoriAd":"Bilim Kurgu"
        },
        "yonetmen" : 
        {
          "yonetmenId":"1",
          "yonetmenAd":"Christoper Nolan"
        }  
      },
      {
        "filmId":"2",
        "filmAd":"Batman Begins",
        "filmResim":"batmanbegins.jpeg",
        "filmYil":"2005",
        "kategori" : 
        {
          "kategoriId":"1",
          "kategoriAd":"Aksiyon"
        },
        "yonetmen" : 
        {
          "yonetmenId":"1",
          "yonetmenAd":"Christoper Nolan"
        }  
      }
      ]}''';

    var jsonVeri = json.decode(strVeri);

    var filmlerCevap = FilmlerCevap.fromJson(jsonVeri);

    int success = filmlerCevap.success;

    // ignore: avoid_print
    print("Success:$success}");

    List<Filmler> filmlerListesi = filmlerCevap.filmlerListesi;

    for (var film in filmlerListesi) {
      // ignore: avoid_print
      print("**************");
      // ignore: avoid_print
      print("Kisi Id:${film.filmId}");
      // ignore: avoid_print
      print("Kisi Ad:${film.filmAd}");
      // ignore: avoid_print
      print("Kisi Yıl:${film.filmYil}");
      // ignore: avoid_print
      print("Kisi Resim:${film.filmResim}");
      // ignore: avoid_print
      print("Film Id:${film.kategori.kategoriId}");
      // ignore: avoid_print
      print("Film Kategori:${film.kategori.kategoriAd}");
      // ignore: avoid_print
      print("Yonetmen Id:${film.yonetmen.yonetmenId}");
      // ignore: avoid_print
      print("Yonetmen Ad:${film.yonetmen.yonetmenAd}");
    }
  }

  @override
  void initState() {
    super.initState();
    // mesajParse();
    // kisilerParse();
    // kisilerCevapParse();
    filmlerCevapParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
