import 'package:flutter/material.dart';

import '../../../common/widgets/custom_text_form_field.dart';
import '../../../utils/constants/sizes.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    super.key,
    required this.alltaskLength,
    required this.tasksInProgressLength,
    required this.tasksPendingLength,
    required this.tasksCompletedLength,
    required this.tasksOverdueLength,
    required this.taskscanceledLength,
  });

  final String alltaskLength;
  final String tasksInProgressLength;
  final String tasksPendingLength;
  final String tasksCompletedLength;
  final String tasksOverdueLength;
  final String taskscanceledLength;
  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.all_inbox_sharp,
      Icons.calendar_month_outlined,
      Icons.pending_outlined,
      Icons.done_all_sharp,
      Icons.assignment_late_outlined,
      Icons.cancel_outlined,
    ];
    final List<Map<String, dynamic>> stats = [
      {'Total des tâches :': alltaskLength},
      {'Tâches en cours :': tasksInProgressLength},
      {'Tâches en Attente :': tasksPendingLength},
      {'Tâches Terminées :': tasksCompletedLength},
      {'Tâches en Retard :': tasksOverdueLength},
      {'Tâches Annulées :': taskscanceledLength},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Général', style: Theme.of(context).textTheme.bodySmall),
        SizedBox(height: TSizes.spaceBtwItems),
        Column(
          children: List.generate(stats.length, (index) {
            return Column(
              children: [
                CustomTextFormField(
                  labelText: stats[index].keys.first,
                  style: Theme.of(context).textTheme.titleMedium,
                  hintText: '',
                  enable: false,
                  prefixIcon: Icon(icons[index]),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(top: TSizes.defaultSpace - 8),
                    child: Text(
                      stats[index].values.first,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems),
              ],
            );
          }),
        ),
      ],
    );
  }
}
