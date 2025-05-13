import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
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
            Text('Voir plus', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CustomCardTask(
                title: 'Aller au cinema',
                level: TaskLevel.high,
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
