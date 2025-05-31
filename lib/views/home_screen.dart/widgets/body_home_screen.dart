import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/custom_list_view_builder.dart';
import '../../../common/widgets/custom_skeleton.dart';
import '../../../cubit/task_cubit/task_cubit.dart';
import '../../../cubit/task_cubit/task_cubit_state.dart';
import '../../../utils/constants/routes.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tâches', style: Theme.of(context).textTheme.headlineSmall),
            TextButton(
              child: Text(
                'Voir plus',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onPressed: () {
                context.go(Routes.allTasks);
              },
            ),
          ],
        ),
        BlocBuilder<TaskCubit, TaskCubitState>(
          builder: (context, state) {
            if (state is LoadingTaskState) {
              return Expanded(
                child: CustomSkeleton(
                  child: CustomListViewBuilder(
                    pathToPop: Routes.home,
                    tasksList: state.taskPlaceholder,
                  ),
                ),
              );
            } else if (state is TaskErrorState) {
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            } else if (state is TaskLoadedState) {
              return Expanded(
                child: CustomListViewBuilder(
                  itemCount: 10,
                  tasksList: state.task,
                  pathToPop: Routes.home,
                ),
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
