import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/custom_skeleton.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_cubit_state.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/popups/popups.dart';
import 'widgets/body_screen.dart';
import 'widgets/custom_app_bar.dart';

class DetailsTask extends StatelessWidget {
  const DetailsTask({super.key, required this.task, required this.pathToPop});

  final Task task;
  final String? pathToPop;
  @override
  Widget build(BuildContext context) {
    context.read<TaskCubit>().getAllTasks();
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
           context.read<TaskCubit>().onEditingTasks();
          },
        ),
        body: BlocBuilder<TaskCubit, TaskCubitState>(
          builder: (context, state) {
            if (state is LoadingTaskState) {
              return CustomSkeleton(child: BodyScreen(task: task));
            } else if (state is TaskLoadedState) {
              return BodyScreen(task: task);
            } else if (state is OnEditingTaskState) {
              return BodyScreen(task: task, onEdit: true);
            } else if (state is TaskErrorState) {
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
