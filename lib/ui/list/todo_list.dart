import 'package:codereview_todo_list/todo/todo_list_view_model.dart';
import 'package:codereview_todo_list/todo/todo_local_repository.dart';
import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:codereview_todo_list/todo/todo_repository.dart';
import 'package:codereview_todo_list/ui/create/todo_create.dart';
import 'package:codereview_todo_list/ui/list/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerStatefulWidget {
  TodoList({super.key});

  @override
  ConsumerState<TodoList> createState() => _TodoListState();
}

class _TodoListState extends ConsumerState<TodoList> {
  TodoRepository todoRepository = TodoLocalRepository();
  bool isDeleteMode = false;
  void onLongPressed() {
    setState(() {
      isDeleteMode = !isDeleteMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoListNotifier);
    final vm = ref.read(todoListNotifier.notifier);
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                // 데이터가 null이면 글쓰기 페이지처럼 보이게 하기
                return TodoCreate(null);
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onLongPress: () {
                print('롱프레스!!!!!');
                onLongPressed();
              },
              child: ListView.separated(
                itemCount: todos.length,
                shrinkWrap: true,
                separatorBuilder: (context, _) => Divider(),
                itemBuilder: (context, index) {
                  return TodoWidget(todos[index], isDeleteMode);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
