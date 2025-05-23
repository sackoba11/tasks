import 'dart:ui';

import '../utils/constants/enums.dart';
import 'sub_task.dart';

class Task {
  final String id;
  final String title;
  final String description;
  TaskStatus status;
  final DateTime dueDate;
  final DateTime createdAt;
  DateTime updatedAt;
  final String tag;
  final List<SubTask> subtasks;
  final Color color;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.status = TaskStatus.enAttente,
    required this.dueDate,
    required this.createdAt,
    required this.color,
    DateTime? updatedAt,
    required this.tag,
    List<SubTask>? subtasks,
  }) : updatedAt = updatedAt ?? DateTime.now(),
       subtasks = subtasks ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status.name,
      'dueDate': dueDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'tag': tag,
      'color': color.value, // Color as int
      'subtasks': subtasks.map((subtask) => subtask.toMap()).toList(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] ?? '',
      status: TaskStatus.values.firstWhere((e) => e.name == map['status']),
      dueDate: DateTime.parse(map['dueDate']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] != null
              ? DateTime.parse(map['updatedAt'])
              : DateTime.now(),
      tag: map['tag'] ?? '',
      color: Color(map['color'] ?? 0xFF2196F3), // valeur par défaut si null
      subtasks:
          (map['subtasks'] as List<dynamic>? ?? [])
              .map(
                (subtask) => SubTask.fromMap(subtask as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  @override
  String toString() {
    return 'Task('
        'id: $id, '
        'title: $title, '
        'description: $description, '
        'status: $status, '
        'dueDate: $dueDate, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'tag: $tag, '
        'color: $color, '
        'subtasks: $subtasks'
        ')';
  }
}
