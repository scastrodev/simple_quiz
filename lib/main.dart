import 'package:flutter/material.dart';

import 'app/questionnaire.dart';
import 'app/questions.dart';
import 'app/result.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.grey[900],
              displayColor: Colors.grey[900],
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedQuestion = 0;

  List<Widget> answers = [];

  get isQuestionAvailable => _selectedQuestion < questions.length;

  int _totalScore = 0;

  void _onAnswer(bool isCorrect, int questionScore) {
    if (isQuestionAvailable) {
      setState(() {
        _selectedQuestion++;
      });
    }
    if (isCorrect) {
      _totalScore += questionScore;
    }

    debugPrint('$_totalScore');
  }

  void _resetQuestions() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz'), centerTitle: true),
      body: SizedBox.expand(
        child: isQuestionAvailable
            ? Column(
                children: [
                  Questionnaire(
                    selectedQuestion: _selectedQuestion,
                    onAnswer: _onAnswer,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Score of this question: ${questions.elementAt(_selectedQuestion)['questionScore']}',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Result(resetQuestions: _resetQuestions, totalScore: _totalScore),
      ),
    );
  }
}
