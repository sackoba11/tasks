import 'package:flutter/material.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/routes.dart';
import '../../utils/constants/sizes.dart';
import '../home_screen.dart/widgets/custom_card_task.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = FakeData.tasks;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.spaceAppBar,
            top: TSizes.spaceAppBar,
          ),
          child: Text(
            'Toutes les Tâches',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body:
          tasksList.isNotEmpty
              ? ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                  vertical: TSizes.defaultSpace,
                ),
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return CustomCardTask(
                    pathToPop: Routes.allTasks,
                    task: tasksList[tasksList.length - index - 1],
                  );
                },
              )
              : Center(
                child: Text(
                  'Aucune tâche trouvée',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
    );
  }
}
