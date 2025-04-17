import 'package:codereview_todo_list/todo/todo_model.dart';

List<TodoModel> todos = [
  TodoModel(
    id: 1,
    title: '강의 듣기',
    memo: 'memo memo memo memo memo memo memo memo',
    createdAt: DateTime.now(),
    isChecked: true,
  ),
  TodoModel(
    id: 2,
    title: '개인 과제하기',
    memo: 'memo memo memo memo memo memo memo memo',
    createdAt: DateTime.now(),
    isChecked: false,
  ),
  TodoModel(
    id: 3,
    title: '코드 리뷰하기',
    memo: 'memo memo memo memo memo memo memo memo',
    createdAt: DateTime.now(),
    isChecked: true,
  ),
  TodoModel(
    id: 4,
    title: '스크럼 하기',
    memo: 'memo memo memo memo memo memo memo memo',
    createdAt: DateTime.now(),
    isChecked: false,
  ),
  TodoModel(
    id: 5,
    title: '아침 코딩 하기',
    memo: 'memo memo memo memo memo memo memo memo',
    createdAt: DateTime.now(),
    isChecked: true,
  ),
];
