import 'package:flutter/material.dart';

import '../../../common/widgets/custom_text_form_field.dart';
import '../../../utils/constants/sizes.dart';
import 'date_icon_button.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.titleController,
    required this.createdAtController,
    required this.createdAtDateTime,
    required this.dueDateController,
    required this.dueDateTime,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController createdAtController;
  final TextEditingController createdAtDateTime;
  final TextEditingController dueDateController;
  final TextEditingController dueDateTime;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            labelText: 'Titre',
            hintText: 'Entrez le titre de la tâche',
            controller: titleController,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          CustomTextFormField(
            labelText: 'Date de début',
            hintText: 'Sélectionnez la date de début 👉',
            controller: createdAtController,
            keyboardType: TextInputType.datetime,
            suffixIcon: DateIconButton(
              controller: createdAtController,
              dateTimeController: createdAtDateTime,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          CustomTextFormField(
            labelText: 'Date de fin',
            hintText: 'Sélectionnez la date de fin 👉',
            controller: dueDateController,
            keyboardType: TextInputType.datetime,
            suffixIcon: DateIconButton(
              controller: dueDateController,
              dateTimeController: dueDateTime,
            ),
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
    );
  }
}
