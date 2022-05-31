import 'package:flutter/material.dart';
import 'package:simple_quiz/app/answer.dart';

class Result extends StatelessWidget {
  const Result({
    required this.resetQuestions,
    required this.totalScore,
    Key? key,
  }) : super(key: key);

  final VoidCallback resetQuestions;
  final int totalScore;

  get resultText {
    late String text;

    if (totalScore >= 6) {
      text = 'Congratulations, you made it!';
    } else {
      text = 'Not was this time! Try again!';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(resultText, style: Theme.of(context).textTheme.headline5),
        Text('Your score was: $totalScore',
            style: Theme.of(context).textTheme.headline6),
        Answer(
          text: 'Restart',
          handleClick: resetQuestions,
        ),
      ],
    );
  }
}
