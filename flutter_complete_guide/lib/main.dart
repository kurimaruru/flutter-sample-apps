import 'package:flutter/material.dart';

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
class MyApp extends StatelessWidget {
  // 意図的に上書きしていることを明示
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Hello World!'),
    );
  }
}
