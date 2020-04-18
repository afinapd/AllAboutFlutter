import 'package:flutter/material.dart';
import 'package:flutter_app/answer.dart';
import 'package:flutter_app/question.dart';

class Quiz extends StatelessWidget{
  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}