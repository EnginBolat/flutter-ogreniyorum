import 'dart:html';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resetHandler, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore == 4) {
      resultText = "You are awsome! Point : $resultScore ";
    } 
    if (resultScore == 3) {
      resultText = "Pretty likeable! Point : $resultScore";
    } 
    if (resultScore == 2) {
      resultText = "Half by Half! Point : $resultScore";
    }
    if (resultScore == 1) {
      resultText = "We Know this is not your best performance! Point : $resultScore";
    }
    else{
      resultText="Thanks for Playing";
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
          RaisedButton(child: Text("Play Again?"), onPressed: resetHandler())
        ],
      ),
    );
  }
}
