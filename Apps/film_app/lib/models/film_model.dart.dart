import 'package:film_app/models/kategori_model.dart';
import 'package:film_app/models/yonetmen_model.dart';

class Filmler {
  String film_id;
  String film_ad;
  String film_resim;
  String film_yil;
  Kategori kategori;
  Yonetmen yonetmen;

  Filmler(this.film_id, this.film_ad, this.film_resim, this.film_yil,
      this.kategori, this.yonetmen);

  factory Filmler.fromJson(Map<dynamic, dynamic> json) {
    return Filmler(
      json["film_id"] as String,
      json["film_ad"] as String,
      json["film_resim"] as String,
      json["film_yil"] as String,
      Kategori.fromJson(json["kategori"]),
      Yonetmen.fromJson(
        json['yonetmen'],
      ),
    );
  }
}
