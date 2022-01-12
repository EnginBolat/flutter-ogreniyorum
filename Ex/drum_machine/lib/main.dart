import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {

  final Oynatici = AudioCache();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumButton("bip",Colors.blue),
                  ),
                  Expanded(child: buildDrumButton("bongo",Colors.redAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: buildDrumButton("clap1",Colors.purpleAccent),
                  ),
                  Expanded(child: buildDrumButton("clap2",Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: buildDrumButton("crash",Colors.yellowAccent),
                  ),
                  Expanded(child: buildDrumButton("how",Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: buildDrumButton("oobah",Colors.pinkAccent),
                  ),
                  Expanded(child: buildDrumButton("ridebel",Colors.brown),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void MuzikCalar(String ses) {
    Oynatici.play("$ses.wav");
  }

  FlatButton buildDrumButton(String ses_al,Color renk) {
    return FlatButton(onPressed: (){MuzikCalar("$ses_al");},
                    padding: EdgeInsets.all(8),
                    child: Container(
                      color: renk,
                    ),
                  );
  }

}
