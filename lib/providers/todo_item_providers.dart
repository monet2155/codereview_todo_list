import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repository/todo_item_repository.dart';
import '../model/todo_item.dart';

final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  return ItemRepository(items: [
    TodoItem(title: "제목1", note: "빨래하기"),
    TodoItem(title: "제목2", note: "공부하기"),
    TodoItem(title: "제목3", note: "산책하기"),
    TodoItem(title: "제목4", note: "숨쉬기 운동"),
    TodoItem(title: "제목5", note: "자러가기"),
  ]);
});

class TodoViewModel extends StateNotifier<List<TodoItem>> {
  final ItemRepository repository;

  TodoViewModel(this.repository) : super(repository.getItems());

  void addItem(TodoItem item) {
    repository.addItem(item);
    state = [...repository.getItems()];
  }
  void toggleCompletion(int index) {
    final updatedItems = [...state];
    updatedItems[index] = TodoItem(
      title: updatedItems[index].title,
      note: updatedItems[index].note,
      isCompleted: !updatedItems[index].isCompleted,
    );
    state = updatedItems;
  }
}

final todoViewModelProvider = StateNotifierProvider<TodoViewModel, List<TodoItem>>((ref) {
  final repository = ref.watch(itemRepositoryProvider);
  return TodoViewModel(repository);
});