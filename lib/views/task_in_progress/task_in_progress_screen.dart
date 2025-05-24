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

class TaskInProgressScreen extends StatelessWidget {
  const TaskInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches en cours')),
      body: BodyScreen(
        children: [
          SearchTextField(searchController: searchController),

          BlocBuilder<TaskCubit, TaskCubitState>(
            builder: (context, state) {
              if (state is LoadingTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
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
                List<Task> inProgressTasks =
                    state.task
                        .where((task) => task.status == TaskStatus.enCours)
                        .toList();
                return Expanded(
                  child: CustomListViewBuilder(tasksList: inProgressTasks),
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
