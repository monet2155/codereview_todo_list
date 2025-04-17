import 'package:codereview_todo_list/todo/todo_local_repository.dart';
import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListNotifier extends Notifier<List<TodoModel>> {
  final repository = TodoLocalRepository();

  @override
  build() {
    return List.from(repository.getAll());
  }

  void getAll() {
    state = List.from(repository.getAll());
  }

  void add({required String title, required String memo}) {
    repository.create(
      TodoModel(
        title: title,
        memo: memo,
        createdAt: DateTime.now(),
        id: repository.maxId(),
        isChecked: false,
      ),
    );
    state = List.from(repository.getAll());
  }

  void modify(TodoModel todo) {
    repository.modify(todo);
    state = List.from(repository.getAll());
  }
}

final todoListNotifier = NotifierProvider<TodoListNotifier, List<TodoModel>>(
  () {
    return TodoListNotifier();
  },
);
