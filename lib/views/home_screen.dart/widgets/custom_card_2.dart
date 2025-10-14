import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_skeleton.dart';
import '../../../controllers/task_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    super.key,
    required this.title,
    required this.numberTask,
    required this.imagePath,
    this.onTap,
    this.color,
  });

  final String title;
  final int numberTask;
  final String imagePath;
  final Color? color;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    return InkWell(
      onTap: onTap,
      child: Obx(() {
        if (taskController.isLoading.value) {
          return CustomSkeleton(
            child: Card(
              margin: EdgeInsets.only(left: 8),
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(height: 80, image: AssetImage(imagePath)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          softWrap: true,
                          title,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(color: TColors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '$numberTask Tâches',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(color: TColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
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
        } else if (taskController.isLoading.value == false) {
          int tasksCanceledLength =
              taskController.taskListRx
                  .where((task) => task.status == TaskStatus.annulee)
                  .toList()
                  .length;
          int tasksOverdueLength =
              taskController.taskListRx
                  .where((task) => task.status == TaskStatus.enRetard)
                  .toList()
                  .length;
          return Card(
            margin: EdgeInsets.only(left: 8),
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(height: 80, image: AssetImage(imagePath)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: TColors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${numberTask == 2 ? tasksOverdueLength : tasksCanceledLength} Tâches',
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(color: TColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      }),
    );
  }
}
