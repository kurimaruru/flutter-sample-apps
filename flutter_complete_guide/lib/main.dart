import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// アプリ起動時に自動的に実行
void main() {
  runApp(MyApp());
}

// こんな感じでアロー関数みたいなこともできる。
// void main() => runApp(MyApp());

// ---------------------------------------------------------------------
// - class MyAppは、新しいウィジェットクラスを定義しています。
// - extends StatelessWidgetのStatelessWidgetは、アプリのUIを構築するために
//   使用され、アプリのステートが変更されないことが保証されることを意味します。
// - Widget build(BuildContext context)は、MyAppクラスのbuildメソッドを
//   定義しています。このメソッドは、MyAppウィジェットのUIを構築し、
//   その結果としてWidgetオブジェクトを返します。
// - return MaterialApp(home: Text('Hello World!'),);は、
//   buildメソッドからMaterialAppウィジェットを返します。
//   MaterialAppは、Material Designのルールに従ってアプリを構築するために使用され、
//   homeプロパティにText('Hello World!')を指定しているので、
//   アプリのホーム画面には "Hello World!"という文字が表示されます。
//-----------------------------------------------------------------------
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // finalとの違いはコンパイル時定数か実行時定数の違い
  static const _questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'blue', 'score': 3},
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 10},
        {'text': 'cat', 'score': 5},
        {'text': 'mouse', 'score': 3},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    } else {
      print('No more questions');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // 意図的に上書きしていることを明示
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text('Hello World!'),
      // アプリのベースとなるページデザインを作成する役割を担う。
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'My First App',
            ),
          ),
          // Columunはレイアウトウィジェット
          body: _questionIndex < _questions.length
              // reactでいうProps的なやつ。dartはコンストラクタで渡す。
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(
                  totalPoint: _totalScore,
                  resetQuiz: _resetQuiz,
                )),
    );
  }
}
