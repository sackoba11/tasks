import '../../models/task.dart' show Task;
import '../../utils/constants/enums.dart';

class FakeData {
  static final List<Task> tasks = [
    Task(
      id: '1',
      title: 'Aller au cinema',
      dueDate: DateTime.now().copyWith(day: 20, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tags: [TaskTag.family, TaskTag.health],
      status: TaskStatus.inProgress,
      description: 'description da la tâche aller au Cinema',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
    Task(
      id: '2',
      title: 'Aller au Marche',
      dueDate: DateTime.now().copyWith(day: 24, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tags: [TaskTag.finance],
      status: TaskStatus.pending,
      description: 'description da la tâche aller au Marche',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
    Task(
      id: '3',
      title: 'Aller a la Maison',
      dueDate: DateTime.now().copyWith(day: 27, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tags: [TaskTag.urgent],
      status: TaskStatus.completed,
      description: 'description da la tâche aller au Maison',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
    Task(
      id: '4',
      title: 'Aller au Village',
      dueDate: DateTime.now().copyWith(day: 30, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tags: [TaskTag.lowPriority],
      status: TaskStatus.overdue,
      description: 'description da la tâche aller au Village',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
    Task(
      id: '7',
      title: 'Aller au Champ',
      dueDate: DateTime.now().copyWith(day: 20, month: 5, year: 2025),
      createdAt: DateTime.now(),
      tags: [TaskTag.other],
      status: TaskStatus.cancelled,
      description: 'description da la tâche aller au Champ',
      updatedAt: DateTime.now(),
      subtasks: [],
    ),
  ];
}
