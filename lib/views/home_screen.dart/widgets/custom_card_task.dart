import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class CustomCardTask extends StatelessWidget {
  const CustomCardTask({
    super.key,
    required this.level,
    required this.title,
    required this.beginTime,
    required this.endTime,
    required this.endDate,
    required this.percentageToEnd,
  });

  final TaskLevel level;
  final String title;
  final DateTime beginTime;
  final DateTime endTime;
  final DateTime endDate;
  final double percentageToEnd;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                    color:
                        level == TaskLevel.urgente
                            ? TColors.levelHighdColor
                            : level == TaskLevel.moyenne
                            ? TColors.levelMediumdColor
                            : TColors.secondary.withOpacity(0.7),
                  ),
                  child: Text(
                    level.name,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Text(
                  '$percentageToEnd%',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                title,
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
                  '${beginTime.hour}:${beginTime.minute} - ${endTime.copyWith(hour: 20).hour}:${endTime.minute} ${endTime.timeZoneName}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Date limite : ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${endDate.day}-${endDate.month}-${endDate.year}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
