import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalPoint;
  final VoidCallback resetQuiz;
  const Result({required this.totalPoint, required this.resetQuiz});

  // Getter
  String get resultPhrase {
    print(totalPoint);
    var resultText = 'You did it!';
    if (totalPoint > 8) {
      resultText = 'You are awesome and innocent!';
    } else if (totalPoint > 12) {
      resultText = 'Pretty likeable!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text('Reset Quiz'),
            style: TextButton.styleFrom(foregroundColor: Colors.orange),
          )
        ],
      ),
    );
    ;
  }
}
