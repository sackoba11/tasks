import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants/enums.dart';
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
            Text('En Cours', style: Theme.of(context).textTheme.headlineSmall),
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
            itemCount: 10,
            itemBuilder: (context, index) {
              return CustomCardTask(
                title: 'Aller au cinema',
                level:
                    index == 2
                        ? TaskLevel.basse
                        : index == 4
                        ? TaskLevel.moyenne
                        : TaskLevel.urgente,
                percentageToEnd: 82,
                beginTime: DateTime.now(),
                endTime: DateTime.now(),
                endDate: DateTime.now(),
              );
            },
          ),
        ),
      ],
    );
  }
}
