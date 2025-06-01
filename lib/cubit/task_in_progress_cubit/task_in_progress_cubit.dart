import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import 'task_in_progress_cubit_state.dart';

class TaskInProgressCubit extends Cubit<TaskInProgressCubitState> {
  TaskInProgressCubit() : super(TaskInProgressCubitInitial());

  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;
  List<Task> allTaskInProgressList = [];

  Future<List<Task>> getInProgressTasks() async {
    try {
      emit(LoadingInProgressTaskState(taskPlaceholder: placeholderTask()));

      allTaskInProgressList = await Future.delayed(
        Duration(milliseconds: 400),
        () {
          var tasks =
              taskList
                  .where((task) => task.status == TaskStatus.enCours)
                  .toList();
          return tasks;
        },
      );
      //  await taskService.getAllTasks();
      emit(
        TaskInProgressLoadedState(
          taskInProgressList: allTaskInProgressList,
          '',
        ),
      );
      return allTaskInProgressList;
    } catch (e) {
      print(e);
      emit(TaskInProgressErrorState(errorMessage: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<List<Task>?> searchTasks({required String search, String? tag}) async {
    List<Task> result;
    try {
      emit(LoadingInProgressTaskState(taskPlaceholder: placeholderTask()));

      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            allTaskInProgressList
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      emit(TaskInProgressLoadedState(taskInProgressList: result, tag));
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
