import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tasks/utils/constants/text_strings.dart';

import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';
import '../../utils/constants/sizes.dart';

class DetailsTask extends StatelessWidget {
  const DetailsTask({super.key, required this.task});

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.cardTaskColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_copy),
          onPressed: () => context.go(Routes.home),
        ),
        actions: [
          IconButton(icon: Icon(Icons.share_outlined), onPressed: () {}),
          IconButton(icon: Icon(Iconsax.edit_2_copy), onPressed: () {}),
        ],
        actionsPadding: EdgeInsets.only(right: TSizes.spaceAppBar),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: TSizes.spaceBtwSections),
            Center(
              child: Text(
                task.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            CustomRowItem(
              title: 'Date Debut: ',
              value:
                  '${TTexts.days[task.createdAt.weekday - 1]}, ${task.createdAt.day} ${TTexts.month[task.createdAt.month - 1]} ${task.createdAt.year}',
            ),

            SizedBox(height: TSizes.spaceBtwSections),
            CustomRowItem(
              title: 'Date Fin : ',
              value:
                  '${TTexts.days[task.dueDate.weekday - 1]}, ${task.dueDate.day} ${TTexts.month[task.dueDate.month - 1]} ${task.dueDate.year}',
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            CustomRowItem(
              title: 'Temps',
              value:
                  '${task.createdAt.hour}:${task.createdAt.minute} - ${task.dueDate.copyWith(hour: 20).hour}:${task.dueDate.minute} ${task.dueDate.timeZoneName}',
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            CustomRowItem(
              title: 'Étiquette :',
              value: '${task.tags.map((tag) => tag.name).toList()}',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRowItem extends StatelessWidget {
  const CustomRowItem({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
