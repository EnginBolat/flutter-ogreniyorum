// ignore_for_file: must_be_immutable

import 'package:bloc_kullanimi/ikinci_sayfa.dart';
import 'package:bloc_kullanimi/sabitler.dart';
import 'package:bloc_kullanimi/sayac_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SayacCubit())],
      child: MaterialApp(
        title: "Block Kullanımı",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 33, 131, 223),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

class Anasayfa extends StatelessWidget {
  Anasayfa({Key? key}) : super(key: key);

  Texts text = Texts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text.appBarText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<SayacCubit, int>(builder: ((context, sayacDegeri) {
              return Text(
                "$sayacDegeri",
                style: const TextStyle(fontSize: 32),
              );
            })),
            ElevatedButton(
              child: Text(text.gecisYap),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IkinciSayfa()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
