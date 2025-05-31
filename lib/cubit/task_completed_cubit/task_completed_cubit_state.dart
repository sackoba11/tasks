import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class TaskCompletedCubitState extends Equatable {}

class TaskCompletedCubitInitial extends TaskCompletedCubitState {
  @override
  List<Object?> get props => [];
}

class LoadingCompletedTaskState extends TaskCompletedCubitState {
  final List<Task> taskPlaceholder;
  LoadingCompletedTaskState({required this.taskPlaceholder});
  @override
  List<Object?> get props => [taskPlaceholder];
}

class TaskCompletedLoadedState extends TaskCompletedCubitState {
  final List<Task> taskCompletedList;
  final String? tag;
  TaskCompletedLoadedState(this.tag, {required this.taskCompletedList});
  @override
  List<Object?> get props => [taskCompletedList, tag];
}

class TaskCompletedErrorState extends TaskCompletedCubitState {
  final String? errorMessage;
  TaskCompletedErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
