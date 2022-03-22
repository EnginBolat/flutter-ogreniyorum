class Kisiler {
  String kisi_ad;
  int kisi_yas;

  Kisiler(this.kisi_ad, this.kisi_yas);

  factory Kisiler.fromJson(Map<dynamic, dynamic> json) {
    return Kisiler(json['kisi_ad'] as String, json["kisi_yas"] as int);
  }
}
