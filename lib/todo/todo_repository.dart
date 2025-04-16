import 'package:codereview_todo_list/todo/todo_model.dart';

abstract interface class TodoRepository {
  List<TodoModel> getAll();

  TodoModel getById(int id);

  void deleteById(int id);

  void create(TodoModel todo);
}
