import 'package:flutter/material.dart';
import './home/home_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
