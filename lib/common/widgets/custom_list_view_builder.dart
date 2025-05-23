import 'package:flutter/material.dart';

import '../../models/task.dart';
import '../../utils/constants/routes.dart';
import 'custom_card_task.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({super.key, required this.tasksList});

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return tasksList.isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),

          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            return CustomCardTask(
              pathToPop: Routes.taskPending,
              task: tasksList[tasksList.length - index - 1],
            );
          },
        )
        : Center(
          child: Text(
            'Aucune tâche trouvée',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        );
  }
}
