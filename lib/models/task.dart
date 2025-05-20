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

  // Convert Task to Firestore Map
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'description': description,
  //     'status': status.name,
  //     'dueDate': dueDate.toIso8601String(),
  //     'createdAt': createdAt.toIso8601String(),
  //     'updatedAt': updatedAt.toIso8601String(),
  //     'tags': tags,
  //     'subtasks': subtasks.map((task) => task.toMap()).toList(),
  //     'attachments': attachments,
  //   };
  // }

  // Create Task from Firestore Map
  // factory Task.fromMap(Map<String, dynamic> map) {
  //   return Task(
  //     id: map['id'],
  //     title: map['title'],
  //     description: map['description'] ?? '',
  //     status: TaskStatus.values.firstWhere((e) => e.name == map['status']),
  //     dueDate: DateTime.parse(map['dueDate']),
  //     createdAt: DateTime.parse(map['createdAt']),
  //     updatedAt: DateTime.parse(map['updatedAt']),
  //     tags:
  //         (map['tags'] as List?)
  //             ?.map((tag) => TaskTag.values.firstWhere((e) => e.name == tag))
  //             .toList() ??
  //         [],
  //     subtasks:
  //         (map['subtasks'] as List?)
  //             ?.map((subtask) => Task.fromMap(subtask))
  //             .toList() ??
  //         [],
  //     attachments: List<String>.from(map['attachments'] ?? []),
  //   );
  // }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, status: $status, dueDate: $dueDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
