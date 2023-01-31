import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // 入力を受け取ったり、何かを返す関数の場合はFunctionを使用し、その反対派VoidCallbackを使用。
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(answerText, style: TextStyle(color: Colors.white)),
        onPressed: selectHandler,
      ),
    );
  }
}
