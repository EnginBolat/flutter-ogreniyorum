import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex > 2) {
      _questionIndex = 0;
    }
    print(_questionIndex);
  }

  var questions = [
    {"questionText" : "What's your favorite Color?","answers":["Black","Red","Green","White"]},
    {"questionText" : "What's your favorite Animal?","answers":["Bear","Lion","Money","Elephant"]},
    {"questionText" : "What's your favorite Instructor?","answers":["Max1","Max2","Max3","Max4"]},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            "This Is My First App",
          ),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['questionText'] as String
              ),

              ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList(),
          ],
        ),
      ),
    );
  }
}
