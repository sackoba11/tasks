import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/cubit/task_cubit/task_cubit.dart';

import '../../models/task.dart';
import 'custom_card_task.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.tasksList,
    required this.pathToPop,
    this.itemCount,
    this.onLongPressed,
  });

  final List<Task> tasksList;
  final String pathToPop;
  final int? itemCount;
  final void Function()? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return tasksList.isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,

          physics: const BouncingScrollPhysics(),

          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            return CustomCardTask(
              pathToPop: pathToPop,
              onLongPressed: () {
                context.read<TaskCubit>().deleteTasks(
                  idTask: tasksList[index].id,
                );
                context.pop();
              },
              task: tasksList[index],
            );
          },
        )
        : Center(
          child: Text(
            'Aucune tâche trouvée',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        );
  }
}
