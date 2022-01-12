import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Center(
          child: Text("Favori Filmim"),
        ),
      ),
      body:Center(
        child: Image.asset('images/avatar_resize.jpg'),
      ),
    ),
  ));
}

