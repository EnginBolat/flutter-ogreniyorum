class Yonetmen{
  String yonetmen_id;
  String yonetmen_ad;

  Yonetmen(this.yonetmen_id,this.yonetmen_ad);

  factory Yonetmen.fromJson(Map<dynamic,dynamic>json){
    return Yonetmen(json["yonetmen_id"] as String,json["yonetmen_ad"] as String);
  }
}