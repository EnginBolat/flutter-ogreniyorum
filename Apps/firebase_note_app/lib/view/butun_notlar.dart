import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:note_app/view/not_ekle_sayfasi.dart';
import 'package:note_app/widget/notlari_listele.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({Key? key}) : super(key: key);

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  @override
  void initState() {
    super.initState();
    firebaseRun();
    const NotlariListele();
  }

  void firebaseRun() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Notlar Uygulaması"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: const NotlariListele(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const NotEkleButton(),
      ),
    );
  }
}
