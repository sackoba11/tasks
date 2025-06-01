import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_overdue_cubit/task_overdue_cubit.dart';
import '../../cubit/task_overdue_cubit/task_overdue_cubit_state.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class TasksOverdueScreen extends StatelessWidget {
  const TasksOverdueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskOverdueCubit>().getOverdueTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches en Retard')),
      body: BodyScreen(
        children: [
          SearchTextField(
            searchController: searchController,
            onChanged: (value) {
              context.read<TaskOverdueCubit>().searchTasks(
                search: value,
                tag: '',
              );
            },
            onSelected: (value) {
              context.read<TaskOverdueCubit>().searchTasks(
                search: value,
                tag: value,
              );
            },
          ),
          BlocBuilder<TaskOverdueCubit, TaskOverdueCubitState>(
            builder: (context, state) {
              if (state is TaskOverdueLoadedState) {
                if (state.tag != null && state.tag!.isNotEmpty) {
                  var tag = Formatter.formatStatus(state.tag!);
                  return TagWidget(
                    tag: tag,
                    onDeleted: () {
                      context.read<TaskOverdueCubit>().searchTasks(
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

          BlocBuilder<TaskOverdueCubit, TaskOverdueCubitState>(
            builder: (context, state) {
              if (state is LoadingOverdueTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
                      pathToPop: Routes.taskOverdue,
                      tasksList: state.taskPlaceholder,
                    ),
                  ),
                );
              } else if (state is TaskOverdueErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              } else if (state is TaskOverdueLoadedState) {
                return Expanded(
                  child: CustomListViewBuilder(
                    tasksList: state.taskOverdueList,
                    pathToPop: Routes.taskOverdue,
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
