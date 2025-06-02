import 'package:flutter/material.dart';

import '../../../common/widgets/custom_text_form_field.dart';
import '../../../models/task.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/formatters/formatter.dart';
import 'custom_row_item.dart';
import 'custom_universal_stepper.dart';
import 'description_screen.dart';
import 'header_screen.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key, required this.task, this.onEdit = false});

  final Task task;
  final bool onEdit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final TextEditingController controller = TextEditingController();

    return Column(
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
              controller: controller,
              onEdit: onEdit,
              value: Formatter.formatDate(task.createdAt),
            ),
            CustomRowItem(
              title: 'Date Fin : ',
              controller: controller,
              onEdit: onEdit,
              value: Formatter.formatDate(task.dueDate),
            ),
            CustomRowItem(
              title: 'Temps',
              controller: controller,
              onEdit: onEdit,
              value:
                  '${Formatter.formatHour(task.createdAt)} - ${Formatter.formatHour(task.dueDate.copyWith(hour: 20))} ${task.dueDate.timeZoneName}',
            ),
            CustomRowItem(
              title: 'Étiquette :',
              controller: controller,
              onEdit: onEdit,
              color: task.color,
              value: Formatter.formatStatus(task.tag),
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
                  'Status : ${Formatter.formatStatus(task.status.name)}',
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
            CustomUniversalStepper(subtasks: task.subtasks, width: size.width),
          ],
        ),
      ],
    );
  }
}
