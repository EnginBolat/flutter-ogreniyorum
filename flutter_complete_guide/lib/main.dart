import 'package:flutter/material.dart';

import 'question.dart';

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

    if (_questionIndex > 1) {
      _questionIndex = 0;
    }
    print(_questionIndex);
  }

  var question = [
    "What's your favorite Color?",
    "What is your favorite Animal?"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green ,
          centerTitle: true,
          title: const Text(
            "This Is My First App",
          ),
        ),
        body: Column(
          children: <Widget>[
            Question(question[_questionIndex]),
            RaisedButton(child: Text("Answer1"), onPressed: _answerQuestion),
            RaisedButton(child: Text("Answer2"), onPressed: _answerQuestion),
            RaisedButton(child: Text("Answer3"), onPressed: _answerQuestion),
          ],
        ),
      ),
    );
  }
}
