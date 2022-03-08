import 'package:flutter/material.dart';
import '../models/db_model.dart';
import '../models/todo_model.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

var titleController = TextEditingController();

class _InsertDataState extends State<InsertData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Data'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Add Title",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  var db = DatabaseConnect();
                  db.insertTodo(
                    Todo(
                      title: titleController.text,
                      creationDate: DateTime.now(),
                      isChecked: false,
                    ),
                  );
                },
                child: const Text("Insert Data")),
          ]),
        ),
      ),
    );
  }
}
