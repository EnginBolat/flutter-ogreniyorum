import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/db_model.dart';
import 'package:flutter_sqlite/pages/delete_data.dart';
import 'package:flutter_sqlite/pages/edit_data.dart';
import 'package:flutter_sqlite/pages/insert_data.dart';
import 'package:flutter_sqlite/pages/list_data.dart';

import 'models/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseConnect();
  //örnek değer
  await db.insertTodo(Todo(
    id: 1,
    title: 'örnek yapılacak',
    creationDate: DateTime.now(),
    isChecked: false,
  ));
  // ignore: avoid_print
  print(await db.getTodo());
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFLITE',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SQFLITE Tutorial'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InsertData()),
                            );
                          },
                          child: const Text("Add Data"))),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditData()),
                            );
                          },
                          child: const Text("Edit Data"))),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListData()),
                            );
                          },
                          child: const Text("List Data"))),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DeleteData()),
                            );
                          },
                          child: const Text("Remove Data"))),
                ]),
          ),
        ),
      ),
    );
  }
}
