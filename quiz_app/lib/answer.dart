import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String answerText;

  Answer({required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(child: Text(answerText),onPressed: null),
    );
  }
}
