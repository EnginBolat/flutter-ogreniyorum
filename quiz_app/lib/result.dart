import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resetHandler, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore == 4) {
      resultText = "You are awsome!";
    } 
    if (resultScore == 3) {
      resultText = "Pretty likeable!";
    } 
    if (resultScore == 2) {
      resultText = "Half by Half";
    }
    else{
      resultText = "We Know this is not your best performance";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase,style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
          ),
          FlatButton(child: Text("Play Again?"), onPressed: resetHandler)
        ],
      ),
    );
  }
}
