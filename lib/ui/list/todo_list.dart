import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:codereview_todo_list/ui/list/todo_widget.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});
  List<TodoModel> todos = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemCount: todos.length,
          separatorBuilder: (context,_) => Divider(),
          itemBuilder: (context, index) {
            return TodoWidget(todos[index]);
          },
        )
      ),
    );
  }
}