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

class TaskLoadedState extends TaskCubitState {
  final List<Task> task;
  final String? tag;
  TaskLoadedState(this.tag, {required this.task});
  @override
  List<Object?> get props => [task, tag];
}

class OnEditingTaskState extends TaskCubitState {
  @override
  List<Object?> get props => [];
}

class TaskErrorState extends TaskCubitState {
  final String? errorMessage;
  TaskErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
