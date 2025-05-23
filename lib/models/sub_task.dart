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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory SubTask.fromMap(Map<String, dynamic> map) {
    return SubTask(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  @override
  String toString() {
    return 'SubTask(id: $id, title: $title, description: $description, isDone: $isDone)';
  }
}
