import 'package:get/get.dart';

import '../data/fake_data/fake_data.dart';
import '../models/task.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/enums.dart';

class TaskController extends GetxController {
  // TaskService taskService = TaskService();
  final List<Task> taskList = FakeData.tasks;
  final RxList<Task> taskListRx = <Task>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isError = false.obs;
  List<Task> allTaskInProgressList = <Task>[].obs;
  final RxString tag = ''.obs;

  Future<List<Task>> getAllTasks() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(milliseconds: 400), () {
        taskListRx.assignAll(taskList);
      });
      //  await taskService.getAllTasks();
      return taskListRx;
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString();
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addTasks({required Task task}) async {
    bool result = false;
    try {
      result = await Future.delayed(Duration(seconds: 2), () {
        taskList.add(task);
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
        taskList.removeWhere((task) => task.id == idTask);
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
      return result;
    } catch (e) {
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

  // Task In progress state
  Future<List<Task>> getInProgressTasks() async {
    try {
      isLoading.value = true;

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
      return allTaskInProgressList;
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString();
      throw Exception(e.toString());
    }
  }

  Future<List<Task>?> searchTasksInProgress({
    required String search,
    String? tag,
  }) async {
    List<Task> result;
    try {
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
      return result;
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString();
      return [];
    }
  }
}
