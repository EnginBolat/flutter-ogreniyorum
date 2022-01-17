import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TestArea"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.green,
          child: Material(
            child: ListTile(
              title: const Text('ListTile with red background'),
              tileColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
