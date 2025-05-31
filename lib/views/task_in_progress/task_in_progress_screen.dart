import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_in_progress_cubit/task_in_progress_cubit.dart';
import '../../cubit/task_in_progress_cubit/task_in_progress_cubit_state.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class TaskInProgressScreen extends StatelessWidget {
  const TaskInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskInProgressCubit>().getInProgressTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches en cours')),
      body: BodyScreen(
        children: [
          SearchTextField(searchController: searchController,onChanged: (value) {
              context.read<TaskInProgressCubit>().searchTasks(search: value, tag: '');
            },
            onSelected: (value) {
              context.read<TaskInProgressCubit>().searchTasks(search: value, tag: value);
            },),

            BlocBuilder<TaskInProgressCubit, TaskInProgressCubitState>(
            builder: (context, state) {
              if (state is TaskInProgressLoadedState) {
                if (state.tag != null && state.tag!.isNotEmpty) {
                  var tag = Formatter.formatStatus(state.tag!);
                  return TagWidget(
                    tag: tag,
                    onDeleted: () {
                      context.read<TaskInProgressCubit>().searchTasks(
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

          BlocBuilder<TaskInProgressCubit, TaskInProgressCubitState>(
            builder: (context, state) {
              if (state is LoadingInProgressTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
                      tasksList: state.taskPlaceholder,
                      pathToPop: Routes.taskInProgress,
                    ),
                  ),
                );
              } else if (state is TaskInProgressErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              } else if (state is TaskInProgressLoadedState) {
                return Expanded(
                  child: CustomListViewBuilder(
                    tasksList: state.taskInProgressList,
                    pathToPop: Routes.taskInProgress,
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
