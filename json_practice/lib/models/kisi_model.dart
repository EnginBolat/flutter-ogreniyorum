class Kisiler {
  String kisiId;
  String kisiAd;
  String kisiTel;

  Kisiler(this.kisiId, this.kisiAd, this.kisiTel);

  factory Kisiler.fromJson(Map<String,dynamic> json){
    return Kisiler(json["kisiId"] as String,json["kisiAd"] as String,json["kisiTel"] as String,);
  }

}