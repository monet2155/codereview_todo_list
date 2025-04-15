import 'package:codereview_todo_list/model/todo_item.dart';

class ItemRepository {
  final List<TodoItem>? items;

  ItemRepository({required this.items});

  // List<TodoItem> getItems() {
  //
  // }

  void addItem(TodoItem item) {
    items?.add(item);
  }
}