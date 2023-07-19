import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.indexAction, required this.question, required this.totalQuestions}) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Question ${indexAction + 1}/$totalQuestions: $question',
      style: const TextStyle(color: neutral, fontSize: 24.0),
      ),
    );
  }
}
