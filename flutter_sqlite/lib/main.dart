import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/db_model.dart';

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
  print(await db.getTodo());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
