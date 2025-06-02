import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/custom_text_form_field.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_cubit_state.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/formatters/formatter.dart';
import '../../utils/popups/popups.dart';
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => context.go(pathToPop!),
      child: Scaffold(
        backgroundColor: TColors.cardTaskColor,
        appBar: customAppBar(
          context: context,
          pathToPop: pathToPop!,
          onDelete: () {
            CustomPopups.showAlert(
              context: context,
              title: 'Suppression',
              message: 'Êtes vous sûr de vouloir supprimer cette tâche?',
              actionText1: 'Supprimer',
              actionText2: 'Annuler',
              onPressed1: () async {
                await context.read<TaskCubit>().deleteTasks(idTask: task.id);
                context.go(pathToPop!);
              },
              onPressed2: () {
                context.pop();
              },
            );
          },
          onEdit: () {
            print('edit');
          },
        ),
        body: BlocBuilder<TaskCubit, TaskCubitState>(
          builder: (context, state) {
            return Column(
              children: [
                HeaderScreen(
                  height: size.height,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Center(
                      child: Text(
                        task.title,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: TColors.black),
                      ),
                    ),
                    CustomRowItem(
                      title: 'Date Debut: ',
                      value: Formatter.formatDate(task.createdAt),
                    ),
                    CustomRowItem(
                      title: 'Date Fin : ',
                      value: Formatter.formatDate(task.dueDate),
                    ),
                    CustomRowItem(
                      title: 'Temps',
                      value:
                          '${Formatter.formatHour(task.createdAt)} - ${Formatter.formatHour(task.dueDate.copyWith(hour: 20))} ${task.dueDate.timeZoneName}',
                    ),
                    CustomRowItem(
                      title: 'Étiquette :',
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
                    CustomUniversalStepper(
                      subtasks: task.subtasks,
                      width: size.width,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
