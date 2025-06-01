import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import 'task_pending_cubit_state.dart';

class TaskPendingCubit extends Cubit<TaskPendingCubitState> {
  TaskPendingCubit() : super(TaskPendingCubitInitial());

  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;
  List<Task> allTaskPendingList = [];

  Future<List<Task>> getPendingTasks() async {
    try {
      emit(LoadingPendingTaskState(taskPlaceholder: placeholderTask()));

      allTaskPendingList = await Future.delayed(
        Duration(milliseconds: 400),
        () {
          var tasks =
              taskList
                  .where((task) => task.status == TaskStatus.enAttente)
                  .toList();
          return tasks;
        },
      );
      //  await taskService.getAllTasks();
      emit(TaskPendingLoadedState(taskPendingList: allTaskPendingList, ''));
      return allTaskPendingList;
    } catch (e) {
      print(e);
      emit(TaskPendingErrorState(errorMessage: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<List<Task>?> searchTasks({required String search, String? tag}) async {
    List<Task> result;
    try {
      emit(LoadingPendingTaskState(taskPlaceholder: placeholderTask()));

      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            allTaskPendingList
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      emit(TaskPendingLoadedState(taskPendingList: result, tag));
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
