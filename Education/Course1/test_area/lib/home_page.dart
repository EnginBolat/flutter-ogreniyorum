import 'package:flutter/material.dart';
import 'package:test_area/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Home !!",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             const Padding(
               padding: EdgeInsets.all(8.0),
               child: Align(
                alignment: Alignment.centerLeft,
                  child:  Text(
                "1.SATIR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.left,
            )),
             ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //2.SATIR
            const Padding(
               padding:  EdgeInsets.all(8.0),
               child: Align(
                alignment: Alignment.centerLeft,
                  child:  Text(
                "2.SATIR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.left,
            )),
             ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //3. SATIR
            const Padding(
               padding:  EdgeInsets.all(8.0),
               child: Align(
                alignment: Alignment.centerLeft,
                  child:  Text(
                "3.SATIR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.left,
            )),
             ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("You Tapped the red box");
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
