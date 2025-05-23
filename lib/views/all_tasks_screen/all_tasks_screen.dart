import 'package:flutter/material.dart';

import '../../common/widgets/body_screen.dart';
import '../../common/widgets/custom_list_view_builder.dart';
import '../../common/widgets/search_text_field.dart';
import '../../common/widgets/title_app_bar.dart';
import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';

class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = FakeData.tasks;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: TitleAppBar(title: 'Toutes les Tâches')),
      body: BodyScreen(
        children: [
          SearchTextField(searchController: searchController),

          Expanded(child: CustomListViewBuilder(tasksList: tasksList)),
        ],
      ),
    );
  }
}
