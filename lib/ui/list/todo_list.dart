import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:codereview_todo_list/ui/list/todo_widget.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});
  List<TodoModel> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'To DO LIST',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print('삭제 클릭');
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('추가 클릭');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 15,
              shrinkWrap: true,
              separatorBuilder: (context, _) => Divider(),
              itemBuilder: (context, index) {
                return TodoWidget(null);
              },
            ),
          ),
        ],
      ),
    );
  }
}
