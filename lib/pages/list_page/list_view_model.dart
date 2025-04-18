import 'package:codereview_todo_list/model/content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 1. 상태 클래스 정의

class TodoState {
  final List<Content> todo;
  TodoState({required this.todo});
}

// 2. 뷰모델 클래스 생성
class TodoViewModel extends Notifier<TodoState> {
  @override
  TodoState build() {
    return TodoState(todo: []);
  }

  void updateState(String title, String content, String date) {
    final newTodo = Content(title: title, content: content, date: date);
    final updatedTodoList = [...state.todo, newTodo]; //기존 상태 복사 + 새로운 리스트 합체
    state = TodoState(todo: updatedTodoList); // 상태 업데이트
  }

  void deleteTodo(Content content) {
    final updatedTodoList = List<Content>.from(state.todo);
    updatedTodoList.removeWhere((todo) => todo.title == content.title);
    state = TodoState(todo: updatedTodoList);
  }
}

// 3. 뷰모델 관리자 생성
final todoViewModelProvider = NotifierProvider<TodoViewModel, TodoState>(
  () => TodoViewModel(),
);
