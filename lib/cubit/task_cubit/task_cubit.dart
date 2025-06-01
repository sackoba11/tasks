import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import 'task_cubit_state.dart';

class TaskCubit extends Cubit<TaskCubitState> {
  TaskCubit() : super(TaskCubitInitial());

  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;

  Future<List<Task>> getAllTasks() async {
    try {
      emit(LoadingTaskState(taskPlaceholder: placeholderTask()));

      final tasks = await Future.delayed(Duration(milliseconds: 400), () {
        return taskList;
      });
      //  await taskService.getAllTasks();
      emit(TaskLoadedState(task: tasks, ''));
      return tasks;
    } catch (e) {
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
      emit(TaskLoadedState(task: taskList, ''));
      return result;
    } catch (e) {
      print(e);
      return result;
    }
  }

  Future<bool> deleteTasks({required String idTask}) async {
    bool result = false;
    try {
      emit(LoadingTaskState(taskPlaceholder: placeholderTask()));
      result = await Future.delayed(Duration(seconds: 2), () {
        taskList.removeWhere((task) => task.id == idTask);
        return true;
      });
      emit(TaskLoadedState(task: taskList, ''));
      return result;
    } catch (e) {
      print(e);
      return result;
    }
  }

  Future<List<Task>?> searchTasks({required String search, String? tag}) async {
    List<Task> result;
    try {
      emit(LoadingTaskState(taskPlaceholder: placeholderTask()));

      final tasks = taskList;

      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            tasks
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      emit(TaskLoadedState(task: result, tag));
      return result;
    } catch (e) {
      print(e);
      return [];
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
