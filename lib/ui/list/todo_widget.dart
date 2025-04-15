
import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  TodoWidget(this.todo, {super.key});
  TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Todo'),
    );
  }
}