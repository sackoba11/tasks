import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class TaskCubitState {}

class TaskCubitInitial extends TaskCubitState {}

class LoadingTaskState extends TaskCubitState {}

class TaskLoadedState extends TaskCubitState {
  final List<Task> task;
  TaskLoadedState({required this.task});
}

class TaskErrorState extends TaskCubitState {
  final String? errorMessage;
  TaskErrorState({this.errorMessage});
}
