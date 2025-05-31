import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import 'task_completed_cubit_state.dart';

class TaskCompletedCubit extends Cubit<TaskCompletedCubitState> {
  TaskCompletedCubit() : super(TaskCompletedCubitInitial());

  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;
  List<Task> allTaskCompletedList = [];

  Future<List<Task>> getCompletedTasks() async {
    try {
      emit(LoadingCompletedTaskState(taskPlaceholder: placeholderTask()));

      allTaskCompletedList = await Future.delayed(
        Duration(milliseconds: 400),
        () {
          var tasks =
              taskList
                  .where((task) => task.status == TaskStatus.terminee)
                  .toList();
          return tasks;
        },
      );
      //  await taskService.getAllTasks();
      emit(
        TaskCompletedLoadedState(taskCompletedList: allTaskCompletedList, ''),
      );
      return allTaskCompletedList;
    } catch (e) {
      print(e);
      emit(TaskCompletedErrorState(errorMessage: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<List<Task>?> searchTasks({required String search, String? tag}) async {
    List<Task> result;
    try {
      emit(LoadingCompletedTaskState(taskPlaceholder: placeholderTask()));

      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            allTaskCompletedList
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      emit(TaskCompletedLoadedState(taskCompletedList: result, tag));
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
