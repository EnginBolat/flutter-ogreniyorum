import 'package:film_app/models/kategori_model.dart';

class KategoriCevap{
  int success;
  List<Kategori> kategoriListesi;

  KategoriCevap(this.success,this.kategoriListesi);

  factory KategoriCevap.fromJson(Map<String,dynamic>json){
    var jsonArray = json["kategoriler"] as List;
    List<Kategori> kategorilerListesi = jsonArray.map((jsonArrayNesnesi) => Kategori.fromJson(jsonArrayNesnesi)).toList();
    return KategoriCevap(json["success"] as int, kategorilerListesi);
  }
}