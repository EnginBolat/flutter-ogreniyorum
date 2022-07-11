import 'package:json_practice/models/kategori_model.dart';
import 'package:json_practice/models/yonetmen_model.dart';

class Filmler {
  String filmId;
  String filmAd;
  String filmResim;
  String filmYil;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler(this.filmId, this.filmAd, this.filmResim, this.filmYil, this.kategori,
      this.yonetmen);

  factory Filmler.fromJson(Map<String, dynamic> json) {
    return Filmler(
      json['filmId'] as String,
      json['filmAd'] as String,
      json['filmResim'] as String,
      json['filmYil'] as String,
      Kategoriler.fromJson(
        json['kategori'],
      ),
      Yonetmenler.fromJson(
        json['yonetmen'],
      ),
    );
  }
}
