class Todo {
  String title;
  bool isDone;
  DateTime date;

  Todo({
    required this.title,
    required this.date,
    this.isDone = false,
  });
}
