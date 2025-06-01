import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_pending_cubit/task_pending_cubit.dart';
import '../../cubit/task_pending_cubit/task_pending_cubit_state.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class TasksPendingScreen extends StatelessWidget {
  const TasksPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskPendingCubit>().getPendingTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches en attente')),
      body: BodyScreen(
        children: [
          SearchTextField(
            searchController: searchController,
            onChanged: (value) {
              context.read<TaskPendingCubit>().searchTasks(
                search: value,
                tag: '',
              );
            },
            onSelected: (value) {
              context.read<TaskPendingCubit>().searchTasks(
                search: value,
                tag: value,
              );
            },
          ),
          BlocBuilder<TaskPendingCubit, TaskPendingCubitState>(
            builder: (context, state) {
              if (state is TaskPendingLoadedState) {
                if (state.tag != null && state.tag!.isNotEmpty) {
                  var tag = Formatter.formatStatus(state.tag!);
                  return TagWidget(
                    tag: tag,
                    onDeleted: () {
                      context.read<TaskPendingCubit>().searchTasks(
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

          BlocBuilder<TaskPendingCubit, TaskPendingCubitState>(
            builder: (context, state) {
              if (state is LoadingPendingTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
                      pathToPop: Routes.taskPending,
                      tasksList: state.taskPlaceholder,
                    ),
                  ),
                );
              } else if (state is TaskPendingErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              } else if (state is TaskPendingLoadedState) {
                return Expanded(
                  child: CustomListViewBuilder(
                    tasksList: state.taskPendingList,
                    pathToPop: Routes.taskPending,
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
