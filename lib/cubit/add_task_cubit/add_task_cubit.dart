import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../models/task.dart';
import 'add_task_cubit_state.dart';

class AddTaskCubit extends Cubit<AddTaskCubitState> {
  AddTaskCubit() : super(AddTaskCubitInitial());

  // Future<List<Task>> fetchPost() async {
  //   try {
  //     emit(AddTaskCubitInitial());

  //     repository.fetchPost().then((posts) {
  //       if (posts != null) {
  //         emit(AddTaskCompletedState(task: posts));
  //       } else {
  //         emit(AddTaskErrorState(errorMessage: "Error while fetching Posts"));
  //       }
  //     });
  //   } catch (e) {
  //     print("Try Catch000");
  //     print(e);
  //     emit(AddTaskErrorState(errorMessage: e.toString()));
  //   }
  // }
}
