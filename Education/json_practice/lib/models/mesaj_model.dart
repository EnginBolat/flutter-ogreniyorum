class Mesajlar {
  late int mesajKod;
  late String mesajIcerik;

  Mesajlar(this.mesajIcerik, this.mesajKod);

  factory Mesajlar.jromJson(Map<String, dynamic> json) {
    return Mesajlar(json['mesajIcerik'] as String, json['mesajKod'] as int);
  }
}
