import 'package:flutter/foundation.dart';

import '../../models/task.dart';

@immutable
abstract class AddTaskCubitState {}

class AddTaskCubitInitial extends AddTaskCubitState {}

class LoadingaddTaskState extends AddTaskCubitState {}

class AddTaskCompletedState extends AddTaskCubitState {
  final Task task;
  AddTaskCompletedState({required this.task});
}

class AddTaskErrorState extends AddTaskCubitState {
  final String? errorMessage;
  AddTaskErrorState({this.errorMessage});
}
