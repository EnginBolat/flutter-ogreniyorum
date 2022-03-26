import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'package:note_app/model/notlar_model.dart';
import 'package:note_app/widget/not_duzenle.dart';
import 'package:note_app/widget/not_sil.dart';

class NotlariListele extends StatefulWidget {
  const NotlariListele({Key? key}) : super(key: key);

  @override
  State<NotlariListele> createState() => _NotlariListeleState();
}

class _NotlariListeleState extends State<NotlariListele> {
  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: refNotlar.onValue,
      builder: (context, event) {
        if (event.hasData) {
          var notlarListesi = <Notlar>[];
          var gelenDegerler = event.data!.snapshot.value as dynamic;
          if (gelenDegerler != null) {
            gelenDegerler.forEach((key, nesne) {
              var gelenNot = Notlar.fromJson(key, nesne);
              notlarListesi.add(gelenNot);
            });
          }

          return ListView.builder(
            itemCount: notlarListesi.length,
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
                                not.not1 != null
                                    ? "Not 1: ${not.not1}".toUpperCase()
                                    : "Not 1: Bulunamadı".toUpperCase(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                not.not2 != null
                                    ? "Not 2: ${not.not2}".toUpperCase()
                                    : "Not 2: Bulunamadı".toUpperCase(),
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
