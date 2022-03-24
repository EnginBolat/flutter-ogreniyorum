import 'package:note_app/model/notlar_model.dart';

class NotlarCevap {
  int success;
  List<Notlar> notlarListesi;

  NotlarCevap(this.success, this.notlarListesi);

  factory NotlarCevap.fromJson(Map<dynamic, dynamic> json) {
    var jsonArray = json["notlar"] as List;
    List<Notlar> notlarListesi = jsonArray
        .map((jsonArrayNesnesi) => Notlar.fromJson(jsonArrayNesnesi))
        .toList();
    return NotlarCevap(json["success"] as int, notlarListesi);
  }
}
