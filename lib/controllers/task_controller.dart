import 'package:get/get.dart';

import '../data/fake_data/fake_data.dart';
import '../models/task.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/enums.dart';

class TaskController extends GetxController {
  // TaskService taskService = TaskService();
  // final List<Task> taskList = FakeData.tasks;

  // Tasks List
  final RxList<Task> taskListRx = <Task>[].obs;
  List<Task> allTaskInProgressListRx = <Task>[].obs;
  List<Task> allTaskCanceledListRx = <Task>[];
  List<Task> allTaskPendingListRx = <Task>[];
  List<Task> allTaskCompletedListRx = <Task>[];

  // task state
  final RxBool isLoading = false.obs;
  final RxBool isLoadingCanceledTask = false.obs;
  final RxBool isLoadingInProgressTask = false.obs;
  final RxBool isLoadingPendingTask = false.obs;
  final RxBool isLoadingCompletedTask = false.obs;

  // Error Message
  final RxString errorMessage = ''.obs;
  final RxString errorMessageCanceledTask = ''.obs;
  final RxString errorMessageInProgressTask = ''.obs;
  final RxString errorMessagePendingTask = ''.obs;
  final RxString errorMessageCompletedTask = ''.obs;

  // Error state
  final RxBool isError = false.obs;
  final RxBool isErrorCanceledTask = false.obs;
  final RxBool isErrorInProgressTask = false.obs;
  final RxBool isErrorPendingTask = false.obs;
  final RxBool isErrorCompletedTask = false.obs;

  // Tags
  final RxString tag = ''.obs;

  Future<List<Task>> getAllTasks() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(milliseconds: 400), () {
        taskListRx.assignAll(FakeData.tasks);
      });
      //  await taskService.getAllTasks();
      return taskListRx;
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString();
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addTasks({required Task task}) async {
    bool result = false;
    try {
      result = await Future.delayed(Duration(seconds: 2), () {
        taskListRx.add(task);
        return true;
      });
      return result;
    } catch (e) {
      return result;
    }
  }

  Future<bool> deleteTasks({required String idTask}) async {
    bool result = false;
    try {
      result = await Future.delayed(Duration(seconds: 2), () {
        taskListRx.removeWhere((task) => task.id == idTask);
        return true;
      });
      return result;
    } catch (e) {
      return result;
    }
  }

  Future<bool> onEditingTasks() async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Task>?> searchTasks({required String search, String? tag}) async {
    List<Task> result;
    try {
      isLoading.value = true;
      final tasks = taskListRx;
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
      return result;
    } catch (e) {
      return [];
    } finally {
      isLoading.value = false;
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

  // Task In progress state
  Future<List<Task>> getInProgressTasks() async {
    try {
      isLoadingInProgressTask.value = true;

      allTaskInProgressListRx = await Future.delayed(
        Duration(milliseconds: 400),
        () {
          var tasks =
              taskListRx
                  .where((task) => task.status == TaskStatus.enCours)
                  .toList();
          return tasks;
        },
      );
      //  await taskService.getAllTasks();
      return allTaskInProgressListRx;
    } catch (e) {
      isErrorInProgressTask.value = true;
      errorMessageInProgressTask.value = e.toString();
      return [];
    } finally {
      isLoadingInProgressTask.value = false;
    }
  }

  Future<List<Task>?> searchTasksInProgress({
    required String search,
    String? tag,
  }) async {
    List<Task> result;
    try {
      isLoadingInProgressTask.value = true;
      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            allTaskInProgressListRx
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      return result;
    } catch (e) {
      isErrorInProgressTask.value = true;
      errorMessageInProgressTask.value = e.toString();
      return [];
    } finally {
      isLoadingInProgressTask.value = false;
    }
  }

  // Task canceled
  Future<List<Task>> getCanceledTasks() async {
    try {
      isLoadingCanceledTask.value = true;

      allTaskCanceledListRx = await Future.delayed(
        Duration(milliseconds: 400),
        () {
          if (taskListRx.isEmpty) {
            getAllTasks();
          }
          var tasks =
              taskListRx
                  .where((task) => task.status == TaskStatus.annulee)
                  .toList();

          return tasks;
        },
      );
      return allTaskCanceledListRx;
    } catch (e) {
      isErrorCanceledTask.value = true;
      errorMessageCanceledTask.value = e.toString();
      return [];
    } finally {
      isLoadingCanceledTask.value = false;
    }
  }

  Future<List<Task>?> searchTasksCanceled({
    required String search,
    String? tag,
  }) async {
    List<Task> result;
    try {
      isLoadingCanceledTask.value = true;
      result = await Future.delayed(Duration(milliseconds: 200), () {
        var searchTask =
            taskListRx
                .where(
                  (task) =>
                      task.tag.toLowerCase().contains(search.toLowerCase()) ||
                      task.title.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
        return searchTask;
      });
      return result;
    } catch (e) {
      isErrorCanceledTask.value = true;
      errorMessageCanceledTask.value = e.toString();
      return [];
    } finally {
      isLoadingCanceledTask.value = false;
    }
  }
}
