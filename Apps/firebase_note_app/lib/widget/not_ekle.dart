import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:note_app/view/butun_notlar.dart';

class NotEkle extends StatefulWidget {
  const NotEkle({Key? key}) : super(key: key);

  @override
  State<NotEkle> createState() => _NotEkleState();
}

class _NotEkleState extends State<NotEkle> {
  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  Future<void> notEkle(String ders_adi, int not1, int not2) async {
    var bilgi = HashMap<String, dynamic>();
    bilgi["ders_adi"] = ders_adi;
    bilgi["not1"] = not1;
    bilgi["not2"] = not2;
    refNotlar.push().set(bilgi);
    // ignore: avoid_print
    print("Veri Eklendi");
  }

  var dersAdiController = TextEditingController();
  var not1Controller = TextEditingController();
  var not2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    firebaseRun();
  }

  void firebaseRun() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ders Adı",
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                controller: dersAdiController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Not 1",
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: not1Controller,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Not 2",
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: not2Controller,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Ders Ekle"),
                onPressed: () {
                  notEkle(
                      dersAdiController.text,
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
    );
  }
}
