import 'package:flutter/material.dart';

import 'package:note_app/view/not_ekle_sayfasi.dart';
import 'package:note_app/widget/not_islemleri.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({Key? key}) : super(key: key);

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  @override
  void initState() {
    super.initState();
    const NotlariListele();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Notlar Uygulaması"),
          centerTitle: true,
        ),
        body: const NotlariListele(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const NotEkleButton(),
      ),
    );
  }
}
