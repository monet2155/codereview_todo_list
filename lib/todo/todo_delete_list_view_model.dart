import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoDeleteListNotifier extends Notifier<List<int>> {
  build() {
    return [];
  }

  void add(int id) {
    state.add(id);
    state = List.from(state);
    print(state);
  }

  void remove(int id) {
    state.removeWhere((e) => e == id);
    state = List.from(state);
    print(state);
  }

  void clear() {
    state.clear();
    state = List.from(state);
  }
}

final deleteListProvider = NotifierProvider<TodoDeleteListNotifier, List<int>>(
  () {
    return TodoDeleteListNotifier();
  },
);
