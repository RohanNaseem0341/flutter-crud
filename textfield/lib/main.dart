// import 'package:aug20/counter.dart';
// import 'package:aug20/todo.dart';
import 'package:flutter/material.dart';
import 'package:textfield/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDOView(),
    );
  }
}
