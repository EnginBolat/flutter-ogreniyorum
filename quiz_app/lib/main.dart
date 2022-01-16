import 'package:flutter/material.dart';

import 'result.dart';
import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What is WWW?",
      "answers": [
        {"text": "World Wide Web", "score": 1},
        {"text": "Wide World Web", "score": 0},
        {"text": "Web Wide World", "score": 0},
        {"text": "Wide Web World", "score": 0},
      ]
    },
    {
      "questionText": "How long is an Olympic swimming pool?",
      "answers": [
        {"text": "50M", "score": 1},
        {"text": "60M", "score": 0},
        {"text": "40M", "score": 0},
        {"text": "100M", "score": 0},
      ]
    },
    {
      "questionText": "What is 'cynophobia' ?",
      "answers": [
        {"text": "Fear of dogs", "score": 1},
        {"text": "Fear of enclosed spaces", "score": 0},
        {"text": "Fear of heights", "score": 0},
        {"text": "Fear of Darkness", "score": 0},
      ]
    },
    {
      "questionText": "How many languages are written from right to left?",
      "answers": [
        {"text": "14", "score": 0},
        {"text": "13", "score": 0},
        {"text": "12", "score": 1},
        {"text": "10", "score": 0},
      ]
    },
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      setState(() {
        _questionIndex += 1;
      });
    });
  }

  void resetScore() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Quiz Game!"),
          backgroundColor: Colors.deepPurple,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,)
            : Result(resetScore,_totalScore),
      ),
    );
  }
}
