import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../cubit/task_cubit/task_cubit.dart';
import '../../../cubit/task_cubit/task_cubit_state.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ButtonAddTask extends StatelessWidget {
  const ButtonAddTask({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TSizes.spaceBtwSections - 4,
      left: TSizes.defaultSpace,
      right: TSizes.defaultSpace,
      child: BlocBuilder<TaskCubit, TaskCubitState>(
        builder: (context, state) {
          return CustomElevatedButton(
            loader:
                (state is LoadingTaskState)
                    ? Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: TColors.black,
                          strokeWidth: 3,
                        ),
                      ),
                    )
                    : null,
            title: 'Ajouter la tâche',
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}
