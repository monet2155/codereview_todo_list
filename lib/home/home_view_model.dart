import 'package:codereview_todo_list/model/todo_item.dart';
import 'package:riverpod/riverpod.dart';

class HomeState {
  final List<TodoItem>? items;


  HomeState(this.items);
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(null);
  }

  void add(String title, String note) {

  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});