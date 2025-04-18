class TodoItem {
  final String title;
  final String note;
  final bool isCompleted;

  TodoItem({required this.title, required this.note, this.isCompleted = false});
}