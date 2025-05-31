import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class TaskPendingCubitState extends Equatable {}

class TaskPendingCubitInitial extends TaskPendingCubitState {
  @override
  List<Object?> get props => [];
}

class LoadingPendingTaskState extends TaskPendingCubitState {
  final List<Task> taskPlaceholder;
  LoadingPendingTaskState({required this.taskPlaceholder});
  @override
  List<Object?> get props => [taskPlaceholder];
}

class TaskPendingLoadedState extends TaskPendingCubitState {
  final List<Task> taskPendingList;
  final String? tag;
  TaskPendingLoadedState(this.tag, {required this.taskPendingList});
  @override
  List<Object?> get props => [taskPendingList, tag];
}

class TaskPendingErrorState extends TaskPendingCubitState {
  final String? errorMessage;
  TaskPendingErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
