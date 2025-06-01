import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/formatters/formatter.dart';
import '../../utils/helpers/helpers.dart';
import '../../utils/popups/popups.dart';

class CustomCardTask extends StatelessWidget {
  const CustomCardTask({
    super.key,
    required this.task,
    required this.pathToPop,
    this.onLongPressed,
  });
  final Task task;
  final String pathToPop;
  final void Function()? onLongPressed;
  @override
  Widget build(BuildContext context) {
    String formattedPercentage = Helpers.calculateSubtasksPercentage(
      task.subtasks,
    );

    return InkWell(
      onTap: () {
        context.goNamed(
          Routes.taskDetails,
          extra: task,
          queryParameters: {'path': pathToPop},
        );
      },
      onLongPress: () {
        CustomPopups.showAlert(
          context: context,
          title: 'Suppression',
          message: 'Êtes vous sûr de vouloir supprimer cette tâche?',
          actionText1: 'Supprimer',
          actionText2: 'Annuler',
          onPressed1: onLongPressed,

          onPressed2: () {
            context.pop();
          },
        );
      },
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(TSizes.sm),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        TSizes.borderRadiusLg,
                      ),
                      color: task.color,
                    ),
                    child: Text(
                      Formatter.formatStatus(task.tag),

                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Text(
                    Formatter.formatStatus(task.status.name),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  task.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    size: TSizes.iconMd,
                    color: TColors.darkGrey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${task.createdAt.hour}:${task.createdAt.minute} - ${task.dueDate.copyWith(hour: 20).hour}:${task.dueDate.minute} ${task.dueDate.timeZoneName}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Date limite : ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          Formatter.formatCardDate(task.dueDate),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    if (task.subtasks.isNotEmpty)
                      Text(
                        '$formattedPercentage%',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
