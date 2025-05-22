class SubTask {
  final String id;
  final String title;
  final String description;
  final bool status;

  SubTask({
    required this.id,
    required this.title,
    required this.description,
    this.status = false,
  });
}
