import '../utils/constants/enums.dart';

class Task {
  final String id;
  final String title;
  final String description;
  TaskStatus status;
  final DateTime dueDate;
  final DateTime createdAt;
  DateTime updatedAt;
  final List<TaskTag> tags;
  final List<Task> subtasks;
  final List<String> attachments;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.status = TaskStatus.pending,
    required this.dueDate,
    required this.createdAt,
    DateTime? updatedAt,
    List<TaskTag>? tags,
    List<Task>? subtasks,
    List<String>? attachments,
  }) : updatedAt = updatedAt ?? DateTime.now(),
       tags = tags ?? [],
       subtasks = subtasks ?? [],
       attachments = attachments ?? [];

  // Convert Task to Firestore Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status.name,
      'dueDate': dueDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'tags': tags,
      'subtasks': subtasks.map((task) => task.toMap()).toList(),
      'attachments': attachments,
    };
  }

  // Create Task from Firestore Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'] ?? '',
      status: TaskStatus.values.firstWhere((e) => e.name == map['status']),
      dueDate: DateTime.parse(map['dueDate']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      tags:
          (map['tags'] as List?)
              ?.map((tag) => TaskTag.values.firstWhere((e) => e.name == tag))
              .toList() ??
          [],
      subtasks:
          (map['subtasks'] as List?)
              ?.map((subtask) => Task.fromMap(subtask))
              .toList() ??
          [],
      attachments: List<String>.from(map['attachments'] ?? []),
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, status: $status, dueDate: $dueDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

