import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionText;
  final int questionIndex;
  final VoidCallback answerQuestion;

  Quiz(
      {required this.questionText,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
