import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class TaskCubitState extends Equatable {}

class TaskCubitInitial extends TaskCubitState {
  @override
  List<Object?> get props => [];
}

class LoadingTaskState extends TaskCubitState {
  final List<Task> taskPlaceholder;
  LoadingTaskState({required this.taskPlaceholder});
  @override
  List<Object?> get props => [taskPlaceholder];
}

class TaskAddedState extends TaskCubitState {
  @override
  List<Object?> get props => [];
}

class TaskLoadedState extends TaskCubitState {
  final List<Task> task;
  TaskLoadedState({required this.task});
  @override
  List<Object?> get props => [task];
}

class TaskErrorState extends TaskCubitState {
  final String? errorMessage;
  TaskErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
