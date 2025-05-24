import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_cubit_state.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskCubit>().fetchTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Toutes les Tâches')),
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
                return Expanded(
                  child: CustomListViewBuilder(tasksList: state.task),
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
