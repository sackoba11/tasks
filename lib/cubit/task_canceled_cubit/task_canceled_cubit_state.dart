import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class TaskCanceledCubitState extends Equatable {}

class TaskCanceledCubitInitial extends TaskCanceledCubitState {
  @override
  List<Object?> get props => [];
}

class LoadingCanceledTaskState extends TaskCanceledCubitState {
  final List<Task> taskPlaceholder;
  LoadingCanceledTaskState({required this.taskPlaceholder});
  @override
  List<Object?> get props => [taskPlaceholder];
}

class TaskCanceledLoadedState extends TaskCanceledCubitState {
  final List<Task> taskCanceledList;
  final String? tag;
  TaskCanceledLoadedState(this.tag, {required this.taskCanceledList});
  @override
  List<Object?> get props => [taskCanceledList, tag];
}

class TaskCanceledErrorState extends TaskCanceledCubitState {
  final String? errorMessage;
  TaskCanceledErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
