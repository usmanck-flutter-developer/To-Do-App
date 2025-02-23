import 'package:flutter/material.dart';
import 'package:todos_app/todo/todo_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.deepPurple, centerTitle: true)),
      home: TodoHomePage(),
    );
  }
}
