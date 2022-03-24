import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/view/butun_notlar.dart';

// ignore: must_be_immutable
class NotDuzenle extends StatefulWidget {
  NotDuzenle(
      {Key? key,
      required this.id,
      required this.ders_adi,
      required this.not1,
      required this.not2})
      : super(key: key);

  String id;
  String ders_adi;
  var not1, not2;

  @override
  State<NotDuzenle> createState() => _NotDuzenleState();
}

class _NotDuzenleState extends State<NotDuzenle> {
  Future<void> notGuncelle(
    String not_id,
    String ders_adi,
    String not1,
    String not2,
  ) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/update_not.php");
    var veri = {
      "not_id": not_id,
      "ders_adi": ders_adi,
      "not1": not1,
      "not2": not2,
    };
    var cevap = await http.post(url, body: veri);
    // ignore: avoid_print
    print("Not Sil Cevap : ${cevap.body}");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const AllNotesPage()));
  }

  var not1Controller = TextEditingController();
  var not2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.ders_adi.toUpperCase()} NOTUNU DÜZENLE"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Önceki Not : ${widget.not1}",
                  ),
                  keyboardType: TextInputType.number,
                  controller: not1Controller,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Önceki Not : ${widget.not2}",
                  ),
                  keyboardType: TextInputType.number,
                  controller: not2Controller,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text("Ders Ekle"),
                  onPressed: () {
                    notGuncelle(widget.id, widget.ders_adi, not1Controller.text,
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
      ),
    );
  }
}
