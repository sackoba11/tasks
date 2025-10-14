import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/custom_list_view_builder.dart';
import '../../../common/widgets/custom_skeleton.dart';
import '../../../controllers/task_controller.dart';
import '../../../utils/constants/routes.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tâches', style: Theme.of(context).textTheme.headlineSmall),
            TextButton(
              child: Text(
                'Voir plus',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onPressed: () {
                context.go(Routes.allTasks);
              },
            ),
          ],
        ),
        Obx(() {
          if (taskController.isLoading.value) {
            return Expanded(
              child: CustomSkeleton(
                child: CustomListViewBuilder(
                  pathToPop: Routes.home,
                  tasksList: taskController.placeholderTask(),
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
          } else if (taskController.taskListRx.isNotEmpty) {
            return Expanded(
              child: CustomListViewBuilder(
                itemCount: 10,
                tasksList: taskController.taskListRx,
                pathToPop: Routes.home,
              ),
            );
          }
          return SizedBox();
        }),
      ],
    );
  }
}
