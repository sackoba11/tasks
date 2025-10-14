import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../controllers/task_controller.dart';
import '../../cubit/task_in_progress_cubit/task_in_progress_cubit.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class TaskInProgressScreen extends StatelessWidget {
  const TaskInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final TaskController taskController = Get.find<TaskController>();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches en cours')),
      body: BodyScreen(
        children: [
          SearchTextField(
            searchController: searchController,
            onChanged: (value) {
              taskController.searchTasksInProgress(search: value, tag: '');
            },
            onSelected: (value) {
              taskController.searchTasksInProgress(search: value, tag: value);
            },
          ),

          Obx(() {
            if (taskController.isLoading.value == false) {
              if (taskController.tag.value.isNotEmpty) {
                var tag = Formatter.formatStatus(taskController.tag.value);
                return TagWidget(
                  tag: tag,
                  onDeleted: () {
                    context.read<TaskInProgressCubit>().searchTasks(
                      search: '',
                      tag: '',
                    );
                  },
                );
              }
            }
            return SizedBox();
          }),

          Obx(() {
            if (taskController.isLoading.value) {
              return Expanded(
                child: CustomSkeleton(
                  child: CustomListViewBuilder(
                    tasksList: taskController.placeholderTask(),
                    pathToPop: Routes.taskInProgress,
                  ),
                ),
              );
            } else if (taskController.isError.value) {
              return Center(
                child: Text(
                  taskController.errorMessage.value,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            } else if (!taskController.isLoading.value) {
              return Expanded(
                child: CustomListViewBuilder(
                  tasksList: taskController.taskListRx,
                  pathToPop: Routes.taskInProgress,
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
