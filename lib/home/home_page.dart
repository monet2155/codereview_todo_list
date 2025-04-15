import 'package:flutter/material.dart';
import '../model/todo_item.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key});

  final List<TodoItem> todoItems = [
    TodoItem(title: "제목1", note: "빨래하기"),
    TodoItem(title: "제목2", note: "공부하기"),
    TodoItem(title: "제목3", note: "산책하기"),
    TodoItem(title: "제목4", note: "숨쉬기 운동"),
    TodoItem(title: "제목5", note: "자러가기"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoItems[index].title),
                  subtitle: Text(todoItems[index].note),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                return const Divider();
            }, itemCount: todoItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
