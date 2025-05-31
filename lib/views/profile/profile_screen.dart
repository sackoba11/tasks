import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_cubit_state.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/body_screen.dart';
import 'widgets/header_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.spaceAppBar,
            top: TSizes.spaceAppBar,
          ),
          child: Text(
            'Profile',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: TSizes.spaceBtwSections),
            HeaderScreen(title: 'Sacko Badra', image: TImages.user),
            SizedBox(height: TSizes.spaceBtwSections),
            BlocBuilder<TaskCubit, TaskCubitState>(
              builder: (context, state) {
                if (state is LoadingTaskState || state is TaskCubitInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is TaskLoadedState) {
                  int tasksPendingLength =
                      state.task
                          .where((task) => task.status == TaskStatus.enAttente)
                          .toList()
                          .length;
                  int tasksCompletedLength =
                      state.task
                          .where((task) => task.status == TaskStatus.terminee)
                          .toList()
                          .length;
                  int tasksInProgressLength =
                      state.task
                          .where((task) => task.status == TaskStatus.enCours)
                          .toList()
                          .length;
                  int tasksOverdueLength =
                      state.task
                          .where((task) => task.status == TaskStatus.enRetard)
                          .toList()
                          .length;
                  int taskscanceledLength =
                      state.task
                          .where((task) => task.status == TaskStatus.annulee)
                          .toList()
                          .length;
                  return BodyScreen(
                    alltaskLength: state.task.length.toString(),
                    tasksInProgressLength: tasksInProgressLength.toString(),
                    tasksCompletedLength: tasksCompletedLength.toString(),
                    tasksOverdueLength: tasksOverdueLength.toString(),
                    tasksPendingLength: tasksPendingLength.toString(),
                    taskscanceledLength: taskscanceledLength.toString(),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
