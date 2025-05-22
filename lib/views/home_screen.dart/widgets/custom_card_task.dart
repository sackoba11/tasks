import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/task.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/routes.dart';
import '../../../utils/constants/sizes.dart';

class CustomCardTask extends StatelessWidget {
  const CustomCardTask({
    super.key,
    required this.task,
    required this.pathToPop,
  });
  final Task task;
  final String pathToPop;
  @override
  Widget build(BuildContext context) {
    double calculateSubtasksPercentage(List<dynamic> subtasks) {
      if (subtasks.isEmpty) return 0;
      final doneCount = subtasks.where((s) => s.isDone == true).length;
      return (doneCount / subtasks.length) * 100;
    }

    double percentage = calculateSubtasksPercentage(task.subtasks);
    String formattedPercentage = percentage.toStringAsFixed(1);

    return InkWell(
      onTap: () {
        context.goNamed(
          Routes.taskDetails,
          extra: task,
          queryParameters: {'path': pathToPop},
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
                      _formatStatus(task.tag),

                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Text(
                    _formatStatus(task.status.name),
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
                          '${task.dueDate.day}-${task.dueDate.month}-${task.dueDate.year}',
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

  String _formatStatus(String status) {
    return status
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}')
        .replaceFirstMapped(
          RegExp(r'^\w'),
          (match) => match.group(0)!.toUpperCase(),
        )
        .trim();
  }
}
