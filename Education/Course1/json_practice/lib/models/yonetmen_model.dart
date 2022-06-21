class Yonetmenler{
  String yonetmenId;
  String yonetmenAd;

  Yonetmenler(this.yonetmenId,this.yonetmenAd);

  factory Yonetmenler.fromJson(Map<String,dynamic>json){
    return Yonetmenler(json['yonetmenId'] as String,json['yonetmenAd'] as String);
  }
}