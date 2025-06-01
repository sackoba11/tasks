import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class TaskOverdueCubitState extends Equatable {}

class TaskOverdueCubitInitial extends TaskOverdueCubitState {
  @override
  List<Object?> get props => [];
}

class LoadingOverdueTaskState extends TaskOverdueCubitState {
  final List<Task> taskPlaceholder;
  LoadingOverdueTaskState({required this.taskPlaceholder});
  @override
  List<Object?> get props => [taskPlaceholder];
}

class TaskOverdueLoadedState extends TaskOverdueCubitState {
  final List<Task> taskOverdueList;
  final String? tag;
  TaskOverdueLoadedState(this.tag, {required this.taskOverdueList});
  @override
  List<Object?> get props => [taskOverdueList, tag];
}

class TaskOverdueErrorState extends TaskOverdueCubitState {
  final String? errorMessage;
  TaskOverdueErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
