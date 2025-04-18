import 'package:codereview_todo_list/model/to_do_model.dart';
import 'package:codereview_todo_list/screen/home/widgets/todo_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<ToDoModel> todoList = [
    ToDoModel('1', true),
    ToDoModel('12', false),
    ToDoModel('13', true),
    ToDoModel('14', false),
    ToDoModel('15', true),
    ToDoModel('16', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoCardWidget(todo: todoList[index]);
        },
      ),
    );
  }
}
