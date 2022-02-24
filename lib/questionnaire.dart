import 'package:flutter/material.dart';
import 'package:simple_quiz/answer.dart';
import 'package:simple_quiz/question.dart';
import 'questions.dart';

class Questionnaire extends StatelessWidget {
  const Questionnaire({
    required this.selectedQuestion,
    required this.onAnswer,
    Key? key,
  }) : super(key: key);

  final int selectedQuestion;
  final void Function(bool, int) onAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Question('${questions.elementAt(selectedQuestion)['text']}'),
          ...questions
              .elementAt(selectedQuestion)
              .cast()['answers']
              .map((answer) => Answer(
                    text: answer['value'],
                    handleClick: () => onAnswer(
                      answer['isCorrect'],
                      questions.elementAt(selectedQuestion)['questionScore'] as int,
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
