import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import 'task_canceled_cubit_state.dart';

class TaskCanceledCubit extends Cubit<TaskCanceledCubitState> {
  TaskCanceledCubit() : super(TaskCanceledCubitInitial());

  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;
  List<Task> allTaskCanceledList = [];

  Future<List<Task>> getCanceledTasks() async {
    try {
      emit(LoadingCanceledTaskState(taskPlaceholder: placeholderTask()));

      allTaskCanceledList = await Future.delayed(
        Duration(milliseconds: 400),
        () {
          var tasks =
              taskList
                  .where((task) => task.status == TaskStatus.annulee)
                  .toList();
          return tasks;
        },
      );
      //  await taskService.getAllTasks();
      emit(TaskCanceledLoadedState(taskCanceledList: allTaskCanceledList, ''));
      return allTaskCanceledList;
    } catch (e) {
      print(e);
      emit(TaskCanceledErrorState(errorMessage: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<List<Task>?> searchTasks({required String search, String? tag}) async {
    List<Task> result;
    try {
      emit(LoadingCanceledTaskState(taskPlaceholder: placeholderTask()));

      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            allTaskCanceledList
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      emit(TaskCanceledLoadedState(taskCanceledList: result, tag));
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
