import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/fake_data/fake_data.dart';
import '../../../utils/constants/routes.dart';
import 'custom_card_task.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                context.go(Routes.taskInProgress);
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: FakeData.tasks.length,
            itemBuilder: (context, index) {
              return CustomCardTask(
                task: FakeData.tasks[FakeData.tasks.length - index - 1],
              );
            },
          ),
        ),
      ],
    );
  }
}
