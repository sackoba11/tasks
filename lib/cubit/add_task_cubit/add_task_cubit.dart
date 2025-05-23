import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_task_cubit_state.dart';

class AddTaskCubit extends Cubit<AddTaskCubitState> {
  AddTaskCubit() : super(AddTaskCubitInitial());
}