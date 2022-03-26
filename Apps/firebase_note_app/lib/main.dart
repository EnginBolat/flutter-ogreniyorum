import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app/view/butun_notlar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
     const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllNotesPage(),
    ),
  );
}
