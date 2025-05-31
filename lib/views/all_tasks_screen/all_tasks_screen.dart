import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_cubit_state.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskCubit>().getAllTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Toutes les Tâches')),
      body: BodyScreen(
        children: [
          SearchTextField(
            searchController: searchController,
            onChanged: (value) {
              context.read<TaskCubit>().searchTasks(search: value, tag: '');
            },
            onSelected: (value) {
              context.read<TaskCubit>().searchTasks(search: value, tag: value);
            },
          ),
          BlocBuilder<TaskCubit, TaskCubitState>(
            builder: (context, state) {
              if (state is TaskLoadedState) {
                if (state.tag != null && state.tag!.isNotEmpty) {
                  var tag = Formatter.formatStatus(state.tag!);
                  return TagWidget(
                    tag: tag,
                    onDeleted: () {
                      context.read<TaskCubit>().searchTasks(
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

          BlocBuilder<TaskCubit, TaskCubitState>(
            builder: (context, state) {
              if (state is LoadingTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
                      pathToPop: Routes.allTasks,
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
                    tasksList: state.task,
                    pathToPop: Routes.allTasks,
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
