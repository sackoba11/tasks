import 'package:flutter/material.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';
import '../home_screen.dart/widgets/custom_card_task.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> completedTasks =
        FakeData.tasks
            .where((task) => task.status == TaskStatus.terminee)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.spaceAppBar,
            top: TSizes.spaceAppBar,
          ),
          child: Text(
            'Tâches Terminées',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body:
          completedTasks.isNotEmpty
              ? ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                  vertical: TSizes.defaultSpace,
                ),
                itemCount: completedTasks.length,
                itemBuilder: (context, index) {
                  return CustomCardTask(
                    task: completedTasks[completedTasks.length - index - 1],
                  );
                },
              )
              : Center(
                child: Text(
                  'Aucune tâche Terminée',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
    );
  }
}
