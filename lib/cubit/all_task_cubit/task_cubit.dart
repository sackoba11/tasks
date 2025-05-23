import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/service/task_service.dart';
import '../../models/task.dart';
import 'task_cubit_state.dart';

class AddTaskCubit extends Cubit<TaskCubitState> {
  AddTaskCubit() : super(TaskCubitInitial());

  TaskService taskService = TaskService();
  Future<List<Task>> fetchPost() async {
    try {
      emit(TaskCubitInitial());

      final taskList = await taskService.getAllTasks();
      if (taskList.isNotEmpty) {
        emit(TaskLoadedState(task: taskList));
        return taskList;
      } else {
        emit(TaskErrorState(errorMessage: "Error while fetching Tasks"));
        throw Exception("Error while fetching Tasks");
      }
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(TaskErrorState(errorMessage: e.toString()));
      throw Exception(e.toString());
    }
  }
}
