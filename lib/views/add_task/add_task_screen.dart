import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/custom_text_form_field.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();
    final TextEditingController priorityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une tâche'),
        leading: IconButton(
          padding: const EdgeInsets.only(left: TSizes.spaceAppBar),
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
            ),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: TSizes.spaceBtwItems),
                CustomTextFormField(
                  labelText: 'Titre',
                  hintText: 'Entrez le titre de la tâche',
                  controller: titleController,
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                CustomTextFormField(
                  labelText: 'Date de début',
                  hintText: 'Sélectionnez la date de début',
                  controller: startDateController,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                CustomTextFormField(
                  labelText: 'Date de fin',
                  hintText: 'Sélectionnez la date de fin',
                  controller: endDateController,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                CustomTextFormField(
                  labelText: 'Priorité',
                  hintText: 'Sélectionnez la priorité',
                  controller: priorityController,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                CustomTextFormField(
                  labelText: 'Description',
                  hintText: 'Entrez la description de la tâche',
                  controller: descriptionController,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.bodyMedium,
                  keyboardType: TextInputType.multiline,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
              ),
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Ajouter la tâche',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: TColors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
