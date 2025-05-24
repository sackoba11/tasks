import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import 'task_cubit_state.dart';

class TaskCubit extends Cubit<TaskCubitState> {
  TaskCubit() : super(TaskCubitInitial());

  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;
  int tasksPending = 0;
  int tasksInProgress = 0;
  int tasksCompleted = 0;
  
  Future<List<Task>> fetchTasks() async {
    try {
      emit(LoadingTaskState(taskPlaceholder: placeholderTask()));

      final tasks = await Future.delayed(Duration(seconds: 2), () {
        return taskList;
      });
      //  await taskService.getAllTasks();
      emit(TaskLoadedState(task: tasks));
      return tasks;
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(TaskErrorState(errorMessage: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<bool> addTasks({required Task task}) async {
    bool result = false;
    try {
      emit(LoadingTaskState(taskPlaceholder: placeholderTask()));
      result = await Future.delayed(Duration(seconds: 2), () {
        taskList.add(task);
        return true;
      });
      emit(TaskAddedState());
      return result;
    } catch (e) {
      print(e);
      return result;
    }
  }

  List<Task> placeholderTask() {
    return List.generate(
      9,
      (index) => Task(
        id: '$index',
        title: 'task',
        description: 'description',
        dueDate: DateTime.now(),
        createdAt: DateTime.now(),
        color: TColors.black,
        tag: 'tag',
      ),
    );
  }
}
