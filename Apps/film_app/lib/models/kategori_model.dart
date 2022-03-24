class Kategori{
  String kategori_id;
  String kategori_ad;

  Kategori(this.kategori_id,this.kategori_ad);

  factory Kategori.fromJson(Map<String,dynamic>json){
    return Kategori(json["kategori_id"] as String,json["kategori_ad"] as String);
  }
}