class SubTask {
  final String id;
  final String title;
  final String description;
  final bool isDone;

  SubTask({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
