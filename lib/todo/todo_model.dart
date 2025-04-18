class TodoModel {
  String title;
  String memo;
  DateTime createdAt;
  int id;
  bool isChecked;

  TodoModel({
    required this.id,
    required this.title,
    required this.memo,
    required this.createdAt,
    required this.isChecked,
  });
}
