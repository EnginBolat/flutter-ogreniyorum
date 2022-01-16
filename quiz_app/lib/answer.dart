import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback selectHandler;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(color: Colors.deepPurple,textColor: Colors.white,child: Text(answerText), onPressed: selectHandler),
    );
  }
}
