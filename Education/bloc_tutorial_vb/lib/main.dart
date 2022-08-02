import 'package:flutter/material.dart';

import 'view/cubit_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Bloc Learn With VB',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const CubitView(),
    );
  }
}
