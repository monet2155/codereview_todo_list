import 'package:codereview_todo_list/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoViewModel extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [Todo(text: 'test')];
  }

  void addTodo(String text) {
    state = [...state, Todo(text: text)];
  }

  void removeTodo(int index) {
    state = [...state]..removeAt(index);
  }
  
  void done(int index){
    state = [
      for (int i = 0; i < state.length; i++)
        i == index
          ? Todo(
            text: state[i].text,
            isDone : !state[i].isDone,
          ) : state[i],
    ];
  }
}
  



final TodoViewModelProvider = NotifierProvider<TodoViewModel, List<Todo>>(() {
  return TodoViewModel();
});
