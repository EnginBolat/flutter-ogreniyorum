import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_thread/multi_thread/multi_thread.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        primarySwatch: Colors.orange,
      ),
      home: const MultiThread(),
    );
  }
}
