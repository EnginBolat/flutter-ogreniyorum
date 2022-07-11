class Kategoriler{
  String kategoriId;
  String kategoriAd;

  Kategoriler(this.kategoriId,this.kategoriAd);

  factory Kategoriler.fromJson(Map<String,dynamic>json){
    return Kategoriler(json['kategoriId'] as String,json['kategoriAd'] as String);
  }
}