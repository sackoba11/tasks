import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import 'task_overdue_cubit_state.dart';

class TaskOverdueCubit extends Cubit<TaskOverdueCubitState> {
  TaskOverdueCubit() : super(TaskOverdueCubitInitial());

  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;
  List<Task> allTaskOverdueList = [];

  Future<List<Task>> getOverdueTasks() async {
    try {
      emit(LoadingOverdueTaskState(taskPlaceholder: placeholderTask()));

      allTaskOverdueList = await Future.delayed(
        Duration(milliseconds: 400),
        () {
          var tasks =
              taskList
                  .where(
                    (task) =>
                        
                        task.status == TaskStatus.enRetard,
                  )
                  .toList();
          return tasks;
        },
      );
      //  await taskService.getAllTasks();
      emit(TaskOverdueLoadedState(taskOverdueList: allTaskOverdueList, ''));
      return allTaskOverdueList;
    } catch (e) {
      print(e);
      emit(TaskOverdueErrorState(errorMessage: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<List<Task>?> searchTasks({required String search, String? tag}) async {
    List<Task> result;
    try {
      emit(LoadingOverdueTaskState(taskPlaceholder: placeholderTask()));

      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            allTaskOverdueList
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      emit(TaskOverdueLoadedState(taskOverdueList: result, tag));
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
