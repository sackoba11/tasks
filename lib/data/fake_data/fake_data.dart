import 'package:flutter/material.dart';

import '../../models/sub_task.dart';
import '../../models/task.dart' show Task;
import '../../utils/constants/enums.dart';

class FakeData {
  static final List<Task> tasks = [
    Task(
      id: '1',
      title: 'Aller au cinema',
      dueDate: DateTime.now().copyWith(day: 20, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tag: TaskTag.family.name,
      status: TaskStatus.inProgress,
      description: 'description da la tâche aller au Cinema',
      color: Colors.yellow,
      updatedAt: DateTime.now(),
      subtasks: [
        SubTask(
          id: '1',
          title: 'prendre le ticket',
          description: 'Faire le rang pour acheter le ticket la veille',
        ),
        SubTask(
          id: '2',
          title: 'Prendre le taxi',
          description: 'Commander un taxi Yango pour le Cinema',
        ),
        SubTask(
          id: '3',
          title: 'Rentrer dans le Cinema',
          description: 'Faire le rang pour entrer dans le Cinema',
        ),
        SubTask(
          id: '4',
          title: 'Rentrer dans le Cinema',
          description: 'Faire le rang pour entrer dans le Cinema',
        ),
      ],
    ),
    Task(
      id: '2',
      title: 'Aller au Marche',
      dueDate: DateTime.now().copyWith(day: 24, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tag: TaskTag.finance.name,
      status: TaskStatus.pending,
      color: Colors.blue,
      description: 'description da la tâche aller au Marche',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
    Task(
      id: '3',
      title: 'Aller a la Maison',
      dueDate: DateTime.now().copyWith(day: 27, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tag: TaskTag.urgent.name,
      status: TaskStatus.completed,
      color: Colors.red,
      description: 'description da la tâche aller au Maison',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
    Task(
      id: '4',
      title: 'Aller au Village',
      dueDate: DateTime.now().copyWith(day: 30, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tag: TaskTag.lowPriority.name,
      status: TaskStatus.overdue,
      color: Colors.green,
      description: 'description da la tâche aller au Village',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
    Task(
      id: '7',
      title: 'Aller au Champ',
      dueDate: DateTime.now().copyWith(day: 20, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tag: TaskTag.other.name,
      status: TaskStatus.cancelled,
      color: Colors.tealAccent,
      description: 'description da la tâche aller au Champ',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
  ];
}
