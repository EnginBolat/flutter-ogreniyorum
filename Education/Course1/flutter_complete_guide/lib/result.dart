import 'package:flutter/material.dart';

class Result extends StatelessWidget {

final int resultScore;
final VoidCallback resetHandler;

Result(this.resultScore, this.resetHandler);

String get resultPhrase {
  String resultText;
  
  if (resultScore <= 8) {
    resultText = "You are awsome and innocent!";
  }
  else if (resultScore <= 12) {
    resultText = "Pretty likeable!";
  }
  else if (resultScore <= 8) {
    resultText = "You are ... strange?";
  }
  else {
    resultText = "You are so bad!";
  }
  return resultText;
}


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase, style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(child: Text("Restart Quiz!"), onPressed: resetHandler,)
        ],
      ), 
    );
  }
}
