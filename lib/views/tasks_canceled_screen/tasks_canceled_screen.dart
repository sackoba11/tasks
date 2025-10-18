import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../controllers/task_controller.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class TasksCanceledScreen extends StatelessWidget {
  const TasksCanceledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final TaskController taskController = Get.find<TaskController>();
    taskController.getCanceledTasks();

    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches Annulées')),
      body: BodyScreen(
        children: [
          SearchTextField(
            searchController: searchController,
            onChanged: (value) {
              taskController.searchTasksCanceled(search: value, tag: '');
            },
            onSelected: (value) {
              taskController.searchTasksInProgress(search: value, tag: value);
            },
          ),
          Obx(() {
            if (taskController.isLoadingCanceledTask.value == false) {
              if (taskController.tag.value.isNotEmpty) {
                var tag = Formatter.formatStatus(taskController.tag.value);
                return TagWidget(
                  tag: tag,
                  onDeleted: () {
                    taskController.searchTasksCanceled(search: "", tag: '');
                  },
                );
              }
            }
            return SizedBox();
          }),

          Obx(() {
            if (taskController.isLoadingCanceledTask.value) {
              return Expanded(
                child: CustomSkeleton(
                  child: CustomListViewBuilder(
                    pathToPop: Routes.taskCanceled,
                    tasksList: taskController.placeholderTask(),
                  ),
                ),
              );
            } else if (taskController.isErrorCanceledTask.value) {
              return Center(
                child: Text(
                  taskController.errorMessageCanceledTask.value,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            } else if (!taskController.isLoadingCanceledTask.value) {
              return Expanded(
                child: CustomListViewBuilder(
                  tasksList: taskController.allTaskCanceledListRx,
                  pathToPop: Routes.taskCanceled,
                ),
              );
            }
            return SizedBox();
          }),
        ],
      ),
    );
  }
}
