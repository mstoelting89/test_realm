import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = [
    {
      'questionText': 'Was ist deine Lieblingsfarbe?',
      'answers': [
        {'text': 'Schwarz', 'score': 10},
        {'text': 'Rot', 'score': 5},
        {'text': 'Blau', 'score': 2}
      ]
    },
    {
      'questionText': 'Was ist dein Lieblingstier?',
      'answers': [
        {'text': 'Hund', 'score': 10},
        {'text': 'Katze', 'score': 1},
        {'text': 'Schwarz', 'score': 3}
      ]
    },
    {
      'questionText': 'Was ist dein Lieblingsdozent?',
      'answers': [
        {'text': 'Ich', 'score': 10},
        {'text': 'Du', 'score': 5},
        {'text': 'Schwarz', 'score': 1}
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex >= _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meine erste App"),
          backgroundColor: Colors.green,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
