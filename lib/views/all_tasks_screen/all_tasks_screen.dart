import 'package:flutter/material.dart';
import 'package:tasks/utils/constants/enums.dart';

import '../../data/fake_data/fake_data.dart';
import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';
import '../../utils/constants/sizes.dart';
import '../home_screen.dart/widgets/custom_card_task.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String _formatStatus(String status) {
      return status
          .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}')
          .replaceFirstMapped(
            RegExp(r'^\w'),
            (match) => match.group(0)!.toUpperCase(),
          )
          .trim();
    }

    List<Task> tasksList = FakeData.tasks;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.spaceAppBar,
            top: TSizes.spaceAppBar,
          ),
          child: Text(
            'Toutes les Tâches',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwInputFields,
              ),
              child: TextFormField(
                controller: searchController,
                cursorColor: TColors.black.withOpacity(0.4),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: TSizes.inputFieldRadius,
                  ),
                  prefixIcon: Icon(Icons.search_sharp),
                  suffixIcon: PopupMenuButton(
                    icon: Icon(Icons.filter_list_sharp),
                    onSelected: (value) {
                      searchController.text = value;
                    },
                    itemBuilder: (context) {
                      return TaskTag.values.map((e) {
                        String name = _formatStatus(e.name);
                        return PopupMenuItem<String>(
                          value: name,
                          child: Text(name),
                        );
                      }).toList();
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.4,
                      color: TColors.black.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(TSizes.spaceAppBar),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                  ),
                ),
              ),
            ),
            tasksList.isNotEmpty
                ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: tasksList.length,
                    itemBuilder: (context, index) {
                      return CustomCardTask(
                        pathToPop: Routes.allTasks,
                        task: tasksList[tasksList.length - index - 1],
                      );
                    },
                  ),
                )
                : Center(
                  child: Text(
                    'Aucune tâche trouvée',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
