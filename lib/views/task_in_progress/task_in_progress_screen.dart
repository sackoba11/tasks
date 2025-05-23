import 'package:flutter/material.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/enums.dart';

class TaskInProgressScreen extends StatelessWidget {
  const TaskInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter tasks to only include in-progress ones
    List<Task> inProgressTasks =
        FakeData.tasks
            .where((task) => task.status == TaskStatus.enCours)
            .toList();
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches en cours')),
      body: BodyScreen(
        children: [
          SearchTextField(searchController: searchController),

          CustomListViewBuilder(tasksList: inProgressTasks),
        ],
      ),
    );
  }
}
