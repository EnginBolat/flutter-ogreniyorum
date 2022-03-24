import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/model/notlar_cevap.dart';
import 'package:note_app/model/notlar_model.dart';
import 'package:note_app/view/butun_notlar.dart';

class NotEkle extends StatefulWidget {
  const NotEkle({Key? key}) : super(key: key);

  @override
  State<NotEkle> createState() => _NotEkleState();
}

class _NotEkleState extends State<NotEkle> {
  List<Notlar> tumNotlarParse(String cevap) {
    return NotlarCevap.fromJson(json.decode(cevap)).notlarListesi;
  }

  Future<List<Notlar>> tumNotlar() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/tum_notlar.php");
    var cevap = await http.get(url);
    return tumNotlarParse(cevap.body);
  }

  Future<void> kisiEkle(String ders_adi, String not1, String not2) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/insert_not.php");
    var veri = {"ders_adi": ders_adi, "not1": not1, "not2": not2};
    var cevap = await http.post(url, body: veri);
    // ignore: avoid_print
    print("Kayıt Cevap:${cevap.body}");
  }

  var dersAdiController = TextEditingController();
  var not1Controller = TextEditingController();
  var not2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    tumNotlar();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).size.height,
          ),
              // bottom: MediaQuery.of(context).viewInsets.bottom + 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ders Adı",
                ),
                controller: dersAdiController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Not 1",
                ),
                keyboardType: TextInputType.number,
                controller: not1Controller,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Not 2",
                ),
                keyboardType: TextInputType.number,
                controller: not2Controller,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Ders Ekle"),
                onPressed: () {
                  kisiEkle(dersAdiController.text, not1Controller.text,
                      not2Controller.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllNotesPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
