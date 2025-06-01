import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/custom_skeleton.dart';
import '../../../cubit/task_cubit/task_cubit.dart';
import '../../../cubit/task_cubit/task_cubit_state.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    super.key,
    required this.title,
    required this.numberTask,
    required this.imagePath,
    this.onTap,
    this.color,
  });

  final String title;
  final int numberTask;
  final String imagePath;
  final Color? color;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BlocBuilder<TaskCubit, TaskCubitState>(
        builder: (context, state) {
          if (state is LoadingTaskState) {
            return CustomSkeleton(
              child: Card(
                margin: EdgeInsets.only(left: 8),
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(height: 80, image: AssetImage(imagePath)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              softWrap: true,
                              title,
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(color: TColors.black),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$numberTask Tâches',
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(color: TColors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
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
            int tasksCanceledLength =
                state.task
                    .where((task) => task.status == TaskStatus.annulee)
                    .toList()
                    .length;
            int tasksOverdueLength =
                state.task
                    .where((task) => task.status == TaskStatus.enRetard)
                    .toList()
                    .length;
            return Card(
              margin: EdgeInsets.only(left: 8),
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(height: 80, image: AssetImage(imagePath)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(color: TColors.black),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${numberTask == 2 ? tasksOverdueLength : tasksCanceledLength} Tâches',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(color: TColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
