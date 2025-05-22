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
    int completedTasksCount =
        FakeData.tasks
            .where((task) => task.status == TaskStatus.terminee)
            .length;

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
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace,
          vertical: TSizes.defaultSpace,
        ),
        itemCount: completedTasksCount,
        itemBuilder: (context, index) {
          // Filter tasks to only include completed ones
          List<Task> completedTasks =
              FakeData.tasks
                  .where((task) => task.status == TaskStatus.terminee)
                  .toList();
          return CustomCardTask(
            task: completedTasks[completedTasks.length - index - 1],
          );
        },
      ),
    );
  }
}
