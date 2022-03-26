import 'package:film_app/models/Kategoriler.dart';
import 'package:film_app/models/film_model.dart.dart';
import 'package:film_app/view/filmdetay_sayfasi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class FilmlerSayfasi extends StatefulWidget {
  Kategoriler kategori;
  FilmlerSayfasi({Key? key, required this.kategori}) : super(key: key);

  @override
  State<FilmlerSayfasi> createState() => _FilmlerSayfasiState();
}

class _FilmlerSayfasiState extends State<FilmlerSayfasi> {
  var refFilmler = FirebaseDatabase.instance.ref().child("filmler");

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kategori.kategori_ad.toUpperCase()),
        centerTitle: true,
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refFilmler.orderByChild("kategori_ad").equalTo(widget.kategori.kategori_ad).onValue,
        builder: (context, event) {
          if (event.hasData) {
            var filmlerListesi = <Filmler>[];
            var gelenDegerler = event.data!.snapshot.value as dynamic;
            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenFilm = Filmler.fromJson(key, nesne);
                filmlerListesi.add(gelenFilm);
              });
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filmlerListesi.length,
              itemBuilder: (context, index) {
                var film = filmlerListesi[index];
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilmlerDetaySayfasi(
                            film: film,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Card(
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Image.network(
                                "http://kasimadalan.pe.hu/filmler/resimler/${film.film_resim}"),
                            const SizedBox(height: 20),
                            Text(
                              film.film_ad,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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
    );
  }
}