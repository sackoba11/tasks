import 'package:flutter/material.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/enums.dart';

class TasksPendingScreen extends StatelessWidget {
  const TasksPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList =
        FakeData.tasks
            .where((task) => task.status == TaskStatus.enAttente)
            .toList();
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Tâches en attente')),
      body: BodyScreen(
        children: [
          SearchTextField(searchController: searchController),

          CustomListViewBuilder(tasksList: tasksList),
        ],
      ),
    );
  }
}
