import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/task_canceled_cubit/task_canceled_cubit.dart';
import 'cubit/task_completed_cubit/task_completed_cubit.dart';
import 'cubit/task_cubit/task_cubit.dart';
import 'cubit/task_in_progress_cubit/task_in_progress_cubit.dart';
import 'cubit/task_overdue_cubit/task_overdue_cubit.dart';
import 'cubit/task_pending_cubit/task_pending_cubit.dart';
import 'root.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => TaskCompletedCubit()),
        BlocProvider(create: (context) => TaskInProgressCubit()),
        BlocProvider(create: (context) => TaskPendingCubit()),
        BlocProvider(create: (context) => TaskCanceledCubit()),
        BlocProvider(create: (context) => TaskOverdueCubit()),
      ],
      child: const Root(),
    ),
  );
}
