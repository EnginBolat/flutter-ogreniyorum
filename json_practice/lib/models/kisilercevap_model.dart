import 'package:json_practice/models/kisi_model.dart';

class KisilerCevap{
  int success;
  List<Kisiler> kisiListesi;

  KisilerCevap(this.success,this.kisiListesi);

  factory KisilerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray=json["kisiler"] as List;
    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayNesnesi)=>Kisiler.fromJson(jsonArrayNesnesi)).toList();
    return KisilerCevap(json["success"] as int, kisilerListesi);
  }
}