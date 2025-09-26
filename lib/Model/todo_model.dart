class Todo {
  String title;
  String description;
  String category;
  bool isDone;
  String? startTime;
  String? endTime;

  Todo({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    this.startTime,
    this.endTime,
  });
}
