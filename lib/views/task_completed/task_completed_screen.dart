import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_completed_cubit/task_completed_cubit.dart';
import '../../cubit/task_completed_cubit/task_completed_cubit_state.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskCompletedCubit>().getCompletedTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches Terminées')),
      body: BodyScreen(
        children: [
          SearchTextField(
            searchController: searchController,
            onChanged: (value) {
              context.read<TaskCompletedCubit>().searchTasks(
                search: value,
                tag: '',
              );
            },
            onSelected: (value) {
              context.read<TaskCompletedCubit>().searchTasks(
                search: value,
                tag: value,
              );
            },
          ),
          BlocBuilder<TaskCompletedCubit, TaskCompletedCubitState>(
            builder: (context, state) {
              if (state is TaskCompletedLoadedState) {
                if (state.tag != null && state.tag!.isNotEmpty) {
                  var tag = Formatter.formatStatus(state.tag!);
                  return TagWidget(
                    tag: tag,
                    onDeleted: () {
                      context.read<TaskCompletedCubit>().searchTasks(
                        search: '',
                        tag: '',
                      );
                    },
                  );
                }
              }
              return SizedBox();
            },
          ),

          BlocBuilder<TaskCompletedCubit, TaskCompletedCubitState>(
            builder: (context, state) {
              if (state is LoadingCompletedTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
                      pathToPop: Routes.taskCompleted,
                      tasksList: state.taskPlaceholder,
                    ),
                  ),
                );
              } else if (state is TaskCompletedErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              } else if (state is TaskCompletedLoadedState) {
                return Expanded(
                  child: CustomListViewBuilder(
                    tasksList: state.taskCompletedList,
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
