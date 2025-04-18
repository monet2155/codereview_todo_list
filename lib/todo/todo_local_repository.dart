import 'dart:math';

import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:codereview_todo_list/todo/todo_repository.dart';
import 'package:codereview_todo_list/todo/todos.dart';

class TodoLocalRepository implements TodoRepository {
  @override
  List<TodoModel> getAll() {
    return todos;
  }

  @override
  TodoModel getById(int id) {
    return todos.where((e) => e.id == id).first;
  }

  @override
  void deleteById(int id) {
    todos.removeWhere((e) => e.id == id);
  }

  @override
  void create(TodoModel todo) {
    todos.add(todo);
  }

  int maxId() {
    return todos.fold(0, (intiail, e) => max(intiail, e.id)) + 1;
  }

  @override
  void modify(TodoModel todo) {
    final target = todos.firstWhere((e) => e.id == todo.id);
    target.title = todo.title;
    target.memo = todo.memo;
  }

  @override
  void deleteByIds(List<int> ids) {
    todos.removeWhere((e) => ids.contains(e.id));
  }

  void setChecked(int id, bool value) {
    todos
        .where((e) {
          return e.id == id;
        })
        .forEach((e) {
          e.isChecked = value;
        });
  }
}
