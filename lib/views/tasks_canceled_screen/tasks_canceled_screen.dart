import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/custom_skeleton.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/tag_widget.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../cubit/task_canceled_cubit/task_canceled_cubit.dart';
import '../../cubit/task_canceled_cubit/task_canceled_cubit_state.dart';
import '../../utils/constants/routes.dart';
import '../../utils/formatters/formatter.dart';

class TasksCanceledScreen extends StatelessWidget {
  const TasksCanceledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<TaskCanceledCubit>().getCanceledTasks();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches Annulées')),
      body: BodyScreen(
        children: [
          SearchTextField(
            searchController: searchController,
            onChanged: (value) {
              context.read<TaskCanceledCubit>().searchTasks(
                search: value,
                tag: '',
              );
            },
            onSelected: (value) {
              context.read<TaskCanceledCubit>().searchTasks(
                search: value,
                tag: value,
              );
            },
          ),
          BlocBuilder<TaskCanceledCubit, TaskCanceledCubitState>(
            builder: (context, state) {
              if (state is TaskCanceledLoadedState) {
                if (state.tag != null && state.tag!.isNotEmpty) {
                  var tag = Formatter.formatStatus(state.tag!);
                  return TagWidget(
                    tag: tag,
                    onDeleted: () {
                      context.read<TaskCanceledCubit>().searchTasks(
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

          BlocBuilder<TaskCanceledCubit, TaskCanceledCubitState>(
            builder: (context, state) {
              if (state is LoadingCanceledTaskState) {
                return Expanded(
                  child: CustomSkeleton(
                    child: CustomListViewBuilder(
                      pathToPop: Routes.taskCanceled,
                      tasksList: state.taskPlaceholder,
                    ),
                  ),
                );
              } else if (state is TaskCanceledErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              } else if (state is TaskCanceledLoadedState) {
                return Expanded(
                  child: CustomListViewBuilder(
                    tasksList: state.taskCanceledList,
                    pathToPop: Routes.taskCanceled,
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
