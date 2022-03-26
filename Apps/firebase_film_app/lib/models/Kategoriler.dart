class Kategoriler {
  String kategori_id;
  String kategori_ad;

  Kategoriler(this.kategori_id, this.kategori_ad);

  factory Kategoriler.fromJson(String key,Map<dynamic,dynamic> json){
    return Kategoriler(key, json["kategori_ad"] as String);
  }
}