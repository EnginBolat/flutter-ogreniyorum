import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';

import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;
  int _totalScore = 0;

void ResetScore(){
  setState(() {
    _questionIndex = 0;
    _totalScore = 0;
  });
}



  void _answerQuestion(int score) {
    _totalScore+=score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  final _questions = const [
    {
      "questionText": "What's your favorite Color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ]
    },
    
    {
      "questionText": "What's your favorite Animal?",
      "answers": [
        {"text": "Bear", "score": 1},
        {"text": "Lion", "score": 1},
        {"text": "Monkey", "score": 1},
        {"text": "Elephant", "score": 1},
      ]
    },

    {
      "questionText": "What's your favorite Instructor?",
      "answers": [
        {"text": "Max", "score": 1},
        {"text": "Max", "score": 1},
        {"text": "Max", "score": 1},
        {"text": "Max", "score": 1},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("This Is My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore,ResetScore),
      ),
    );
  }
}
