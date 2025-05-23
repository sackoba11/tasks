import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/custom_text_form_field.dart';
import '../../helpers/helpers.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_row_item.dart';
import 'widgets/custom_universal_stepper.dart';
import 'widgets/description_screen.dart';
import 'widgets/header_screen.dart';

class DetailsTask extends StatelessWidget {
  const DetailsTask({super.key, required this.task, required this.pathToPop});

  final Task task;
  final String? pathToPop;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async {
        context.go(pathToPop!);
        return false;
      },
      child: Scaffold(
        backgroundColor: TColors.cardTaskColor,
        appBar: customAppBar(context: context, pathToPop: pathToPop!),
        body: Column(
          children: [
            HeaderScreen(
              height: size.height,
              children: [
                SizedBox(height: size.height * 0.02),
                Center(
                  child: Text(
                    task.title,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.copyWith(color: TColors.black),
                  ),
                ),
                CustomRowItem(
                  title: 'Date Debut: ',
                  value:
                      '${TTexts.days[task.createdAt.weekday - 1]}, ${task.createdAt.day} ${TTexts.month[task.createdAt.month - 1]} ${task.createdAt.year}',
                ),

                CustomRowItem(
                  title: 'Date Fin : ',
                  value:
                      '${TTexts.days[task.dueDate.weekday - 1]}, ${task.dueDate.day} ${TTexts.month[task.dueDate.month - 1]} ${task.dueDate.year}',
                ),
                CustomRowItem(
                  title: 'Temps',
                  value:
                      '${task.createdAt.hour}:${task.createdAt.minute} - ${task.dueDate.copyWith(hour: 20).hour}:${task.dueDate.minute} ${task.dueDate.timeZoneName}',
                ),
                CustomRowItem(
                  title: 'Étiquette :',
                  color: task.color,
                  value: Helpers.formatStatus(task.tag),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
            DescriptionScreen(
              height: size.height,
              children: [
                SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                    Text(
                      'Status : ${Helpers.formatStatus(task.status.name)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                CustomTextFormField(
                  labelText: task.description,
                  hintText: '',
                  enable: false,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.bodyMedium,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: Text(
                    ' (${task.subtasks.length} sous-tâches)',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                CustomUniversalStepper(
                  subtasks: task.subtasks,
                  width: size.width,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
