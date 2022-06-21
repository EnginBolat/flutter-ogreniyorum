import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "BUGÜN NE YESEM?",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  //Degiskenler
  int corbaNo=1;
  int yemekNo=1;
  int tatliNo=1;
  List<String> corbaAdlari = ["Mercimek","Tarhana","Tavuksuyu","Düğün","Yoğurtlu"];
  List<String> yemekAdlari = ["Karnıyarık","Mantı","Kuru Fasülye","İçli Köfte","Izgara Balk"];
  List<String> tatliAdlari = ["Kadayıf","Baklava","Sütlaç","Kazandibi","Dondurma"];
  void randomNumara(){
  setState(() {
    corbaNo=Random().nextInt(5)+1;
    yemekNo=Random().nextInt(5)+1;
    tatliNo=Random().nextInt(5)+1;
  });
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                onPressed: randomNumara,
                child: Image.asset('assets/corba_$corbaNo.jpg'),highlightColor: Colors.white,splashColor: Colors.white,),
            ),),
          Text(corbaAdlari[corbaNo-1],style: TextStyle(fontSize: 20,)),
          Container(width: 200,child: Divider(height: 5,color: Colors.black,),),

          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FlatButton(
                  onPressed: randomNumara,
                  child: Image.asset('assets/yemek_$yemekNo.jpg'),highlightColor: Colors.white,splashColor: Colors.white,),
              )),
          Text(yemekAdlari[yemekNo-1],style: TextStyle(fontSize: 20,)),
          Container(width: 200,child: Divider(height: 5,color: Colors.black,),),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(onPressed:randomNumara,
                child: Image.asset('assets/tatli_$tatliNo.jpg'),highlightColor: Colors.white,splashColor: Colors.white,),
            ),
          ),
          Text(tatliAdlari[tatliNo-1],style: TextStyle(fontSize: 20,)),
        ],
      ),
    );
  }
}


