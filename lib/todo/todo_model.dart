class TodoModel {
  String title;
  String memo;
  DateTime createdAt;
  int id;
  bool isChecked;

  TodoModel(this.id, this.title, this.memo, this.createdAt, this.isChecked);
}
