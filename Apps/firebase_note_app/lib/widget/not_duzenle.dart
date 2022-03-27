import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  Future<void> notGuncelle(
    String not_id,
    String ders_adi,
    int not1,
    int not2,
  ) async {
    var guncelBilgi = HashMap<String, dynamic>();
    guncelBilgi["ders_adi"] = ders_adi;
    guncelBilgi["not1"] = not1;
    guncelBilgi["not2"] = not2;
    refNotlar.child(not_id).update(guncelBilgi);
  }

  @override
  void initState() {
    super.initState();
    firebaseRun();
  }

  void firebaseRun() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

  var not1Controller = TextEditingController();
  var not2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                    labelStyle: const TextStyle(color: Colors.green),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  cursorColor: Colors.green,
                  keyboardType: TextInputType.number,
                  controller: not1Controller,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Önceki Not : ${widget.not2}",
                    labelStyle: const TextStyle(color: Colors.green),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  cursorColor: Colors.green,
                  keyboardType: TextInputType.number,
                  controller: not2Controller,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text("Ders Ekle"),
                  onPressed: () {
                    notGuncelle(
                        widget.id,
                        widget.ders_adi,
                        int.parse(not1Controller.text),
                        int.parse(not2Controller.text));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllNotesPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
