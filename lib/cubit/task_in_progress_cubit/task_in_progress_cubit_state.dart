import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class TaskInProgressCubitState extends Equatable {}

class TaskInProgressCubitInitial extends TaskInProgressCubitState {
  @override
  List<Object?> get props => [];
}

class LoadingInProgressTaskState extends TaskInProgressCubitState {
  final List<Task> taskPlaceholder;
  LoadingInProgressTaskState({required this.taskPlaceholder});
  @override
  List<Object?> get props => [taskPlaceholder];
}

class TaskInProgressLoadedState extends TaskInProgressCubitState {
  final List<Task> taskInProgressList;
  final String? tag;
  TaskInProgressLoadedState(this.tag, {required this.taskInProgressList});
  @override
  List<Object?> get props => [taskInProgressList, tag];
}

class TaskInProgressErrorState extends TaskInProgressCubitState {
  final String? errorMessage;
  TaskInProgressErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
