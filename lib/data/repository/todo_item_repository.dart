import '../../model/todo_item.dart';

class ItemRepository {
  final List<TodoItem> items;

  ItemRepository({List<TodoItem>? items}) : items = items ?? [];

  List<TodoItem> getItems() => items;

  void addItem(TodoItem item) => items.add(item);
}