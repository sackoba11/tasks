import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_skeleton.dart';
import '../../../controllers/task_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
    this.color,
  });

  final String title;
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
              margin: EdgeInsets.only(right: 8),
              color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(width: 80, image: AssetImage(imagePath)),
                  ),
                  Center(
                    child: ListTile(
                      title: Text(title),
                      subtitle: Text('number'),
                    ),
                  ),
                ],
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
          int tasksLength =
              taskController.taskListRx
                  .where((task) => task.status == TaskStatus.enAttente)
                  .toList()
                  .length;
          return Card(
            margin: EdgeInsets.only(right: 8),
            color: color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: Image(width: 80, image: AssetImage(imagePath))),
                Center(
                  child: ListTile(
                    title: Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: TColors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '$tasksLength Tâches',
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: TColors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      }),
    );
  }
}
