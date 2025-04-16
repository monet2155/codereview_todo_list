import 'package:codereview_todo_list/ui/create/todo_create.dart';
import 'package:codereview_todo_list/ui/list/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoCreate());
  }
}
