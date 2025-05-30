import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_cubit_state.dart';
import '../../models/task.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/routes.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskCubit>().getAllTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches Terminées')),
      body: BodyScreen(
        children: [
          SearchTextField(searchController: searchController),

          BlocBuilder<TaskCubit, TaskCubitState>(
            builder: (context, state) {
              if (state is LoadingTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
                      pathToPop: Routes.taskCompleted,
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
                List<Task> tasksCompleted =
                    state.task
                        .where((task) => task.status == TaskStatus.terminee)
                        .toList();
                return Expanded(
                  child: CustomListViewBuilder(
                    tasksList: tasksCompleted,
                    pathToPop: Routes.taskCompleted,
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
