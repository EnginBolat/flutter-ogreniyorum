import 'package:film_app/models/film_model.dart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilmlerDetaySayfasi extends StatefulWidget {
  Filmler film;
  FilmlerDetaySayfasi({Key? key, required this.film}) : super(key: key);

  @override
  State<FilmlerDetaySayfasi> createState() => _FilmlerDetaySayfasiState();
}

class _FilmlerDetaySayfasiState extends State<FilmlerDetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_ad.toUpperCase()),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                    "http://kasimadalan.pe.hu/filmler/resimler/${widget.film.film_resim}"),
                Text(
                  ("Film Adı: ${widget.film.film_ad}"),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  ("Yönetmen Adı: ${widget.film.yonetmen.yonetmen_ad}"),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  ("Yapım Yılı: ${widget.film.film_yil}"),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
