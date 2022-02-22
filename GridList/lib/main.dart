import 'package:flutter/material.dart';
import 'package:list_test/widgets/gridview.dart';
import 'package:list_test/widgets/listview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(201, 183, 156, 100),
        accentColor: const Color.fromRGBO(201, 183, 156, 100),
        fontFamily: "OpenSans",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                fontFamily: "OpenSans",
                // fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
              headline6: const TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
                color: Colors.white,
              ),
            ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("PERSONAL PAGE"),
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: const ShowGridView(),
      // body: const showListView(),
    );
  }
}
