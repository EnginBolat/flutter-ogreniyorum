import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NotSil extends StatefulWidget {
  NotSil({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<NotSil> createState() => _NotSilState();
}

class _NotSilState extends State<NotSil> {
  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  Future<void> notSil(String not_id) async {
    refNotlar.child(not_id).remove();
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

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        notSil(widget.id);
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}
