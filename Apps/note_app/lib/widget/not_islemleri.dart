import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:note_app/model/notlar_cevap.dart';
import 'package:note_app/model/notlar_model.dart';
import 'package:note_app/view/butun_notlar.dart';
import 'package:note_app/widget/not_duzenle.dart';
import 'package:note_app/widget/not_sil.dart';

class NotlariListele extends StatefulWidget {
  const NotlariListele({Key? key}) : super(key: key);

  @override
  State<NotlariListele> createState() => _NotlariListeleState();
}

class _NotlariListeleState extends State<NotlariListele> {
  List<Notlar> tumNotlarParse(String cevap) {
    return NotlarCevap.fromJson(json.decode(cevap)).notlarListesi;
  }

  Future<List<Notlar>> tumNotlar() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/tum_notlar.php");
    var cevap = await http.get(url);
    return tumNotlarParse(cevap.body);
  }

  Future<void> notSil(int not_id) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/delete_not.php");
    var veri = {"not_id": not_id.toString()};
    var cevap = await http.post(url, body: veri);
    // ignore: avoid_print
    print("Not Sil Cevap : ${cevap.body}");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AllNotesPage()));
  }

  @override
  void initState() {
    super.initState();
    tumNotlar();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Notlar>>(
      future: tumNotlar(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var notlarListesi = snapshot.data;
          return ListView.builder(
            itemCount: notlarListesi!.length,
            itemBuilder: (context, index) {
              var not = notlarListesi[index];
              return Center(
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              not.ders_adi.length > 10
                                  ? Text(
                                      "Ders Adı: ${not.ders_adi}".toUpperCase(),
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  : Text(
                                      "Ders Adı: ${not.ders_adi}".toUpperCase(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                              const SizedBox(height: 10),
                              Text(
                                "Not 1: ${not.not1}".toUpperCase(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Not 2: ${not.not2}".toUpperCase(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => NotDuzenle(
                                            id: not.not_id,
                                            ders_adi: not.ders_adi,
                                            not1: not.not1,
                                            not2: not.not2)),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                              NotSil(id: not.not_id),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text("Not Bulunamadı!"));
        }
      },
    );
  }
}
