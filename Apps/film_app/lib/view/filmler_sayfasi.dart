import 'package:film_app/models/film_model.dart.dart';
import 'package:film_app/models/filmcevap_model.dart';
import 'package:film_app/models/kategori_model.dart';
import 'package:film_app/view/filmdetay_sayfasi.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class FilmlerSayfasi extends StatefulWidget {
  Kategori kategori;
  FilmlerSayfasi({Key? key, required this.kategori}) : super(key: key);

  @override
  State<FilmlerSayfasi> createState() => _FilmlerSayfasiState();
}

class _FilmlerSayfasiState extends State<FilmlerSayfasi> {
  List<Filmler> filmlerParse(String cevap) {
    return FilmlerCevap.fromJson(json.decode(cevap)).filmlerListesi;
  }

  Future<List<Filmler>> tumFilmler(int kategori_id) async {
    var url = Uri.parse(
        "http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php");
    var veri = {"kategori_id": kategori_id.toString()};
    var cevap = await http.post(url, body: veri);
    return filmlerParse(cevap.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kategori.kategori_ad.toUpperCase()),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Filmler>>(
        future: tumFilmler(int.parse(widget.kategori.kategori_id)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filmlerListesi!.length,
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
