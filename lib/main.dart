import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/task_cubit/task_cubit.dart';
import 'root.dart';

void main() {
  runApp(BlocProvider(create: (context) => TaskCubit(), child: const Root()));
}
