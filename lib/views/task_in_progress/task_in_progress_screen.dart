import 'package:flutter/material.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';
import '../home_screen.dart/widgets/custom_card_task.dart';

class TaskInProgressScreen extends StatelessWidget {
  const TaskInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter tasks to only include in-progress ones
    List<Task> inProgressTasks =
        FakeData.tasks
            .where((task) => task.status == TaskStatus.enCours)
            .toList();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.spaceAppBar,
            top: TSizes.spaceAppBar,
          ),
          child: Text(
            'Tâches en cours',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body:
          inProgressTasks.isNotEmpty
              ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                  vertical: TSizes.defaultSpace,
                ),
                itemCount: inProgressTasks.length,
                itemBuilder: (context, index) {
                  return CustomCardTask(
                    task: inProgressTasks[inProgressTasks.length - index - 1],
                  );
                },
              )
              : Center(
                child: Text(
                  'Aucune tâche en cours',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
    );
  }
}
