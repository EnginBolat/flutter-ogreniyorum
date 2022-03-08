import 'package:flutter/material.dart';

import '../models/db_model.dart';
import '../models/todo_model.dart';

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

  

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data'),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.red,
              child: Text("ASDAS"),
            ),
          );
        }),
      ),
    );
  }
}
