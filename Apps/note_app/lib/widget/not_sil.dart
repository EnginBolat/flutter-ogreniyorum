import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/view/butun_notlar.dart';

class NotSil extends StatefulWidget {
NotSil({Key? key, required this.id}) : super(key: key);
String id;

  @override
  State<NotSil> createState() => _NotSilState();
}


class _NotSilState extends State<NotSil> {




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
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        notSil(int.parse(widget.id));
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}
