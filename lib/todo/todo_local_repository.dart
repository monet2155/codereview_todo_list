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
}
