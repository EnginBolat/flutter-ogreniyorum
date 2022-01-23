import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card_control.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text("Shoe Shop",textAlign: TextAlign.start,style:GoogleFonts.getFont("Sedgwick Ave",fontWeight: FontWeight.bold,fontSize: 24),),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            height: 200,
            width: double.infinity,
            child: CardControl(),
          ),
        ),
      ),
    );
  }
}
