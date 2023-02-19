import 'package:flutter/material.dart';
import 'package:go_router_learn/view/home_page/view/home_page.dart';

import 'constants/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Learn',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: router,
    );
  }
}
