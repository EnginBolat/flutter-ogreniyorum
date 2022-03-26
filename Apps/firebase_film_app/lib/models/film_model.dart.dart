class Filmler {
  String film_id;
  String film_ad;
  String film_resim;
  int film_yil;
  String kategori_ad;
  String yonetmen_ad;

  Filmler(this.film_id, this.film_ad, this.film_resim, this.film_yil,
      this.kategori_ad, this.yonetmen_ad);

  factory Filmler.fromJson(String key, Map<dynamic, dynamic> json) {
    return Filmler(
      json["film_id"] as String,
      json["film_ad"] as String,
      json["film_resim"] as String,
      json["film_yil"] as int,
      json["kategori_ad"] as String,
      json["yonetmen_ad"] as String,
    );
  }
}
