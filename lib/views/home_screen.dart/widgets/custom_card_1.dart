import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/custom_skeleton.dart';
import '../../../cubit/task_cubit/task_cubit.dart';
import '../../../cubit/task_cubit/task_cubit_state.dart';
import '../../../utils/constants/colors.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
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
    context.read<TaskCubit>().fetchTasks();
    return InkWell(
      onTap: onTap,
      child: BlocBuilder<TaskCubit, TaskCubitState>(
        builder: (context, state) {
          if (state is LoadingTaskState) {
            return CustomSkeleton(
              child: Card(
                margin: EdgeInsets.only(right: 8),
                color: color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(width: 80, image: AssetImage(imagePath)),
                    ),
                    Center(
                      child: ListTile(
                        title: Text(title),
                        subtitle: Text('$numberTask Tâches'),
                      ),
                    ),
                  ],
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
            return Card(
              margin: EdgeInsets.only(right: 8),
              color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(width: 80, image: AssetImage(imagePath)),
                  Center(
                    child: ListTile(
                      title: Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: TColors.black),
                      ),
                      subtitle: Text(
                        '$numberTask Tâches',
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(color: TColors.black),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
