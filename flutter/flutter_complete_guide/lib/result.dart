import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final void Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultText {
    String text;
    if (resultScore <= 8) {
      text = "Test 1";
    } else if (resultScore <= 12) {
      text = "Test 2";
    } else if (resultScore <= 16) {
      text = "Test 3";
    } else {
      text = "Test 4";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          resultText,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: resetHandler, child: Text("Quiz neustarten"))

      ],)

    );
  }
}
