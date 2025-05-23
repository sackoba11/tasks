import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/custom_elevated_button.dart';
import '../../common/widgets/custom_icon_button.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../data/fake_data/fake_data.dart';
import '../../helpers/helpers.dart';
import '../../models/sub_task.dart';
import '../../models/task.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/custom_stepper.dart';
import 'widgets/date_icon_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Color dialogPickerColor = Colors.blue;
  final List<SubTask> subTask = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController createdAtController = TextEditingController();
  final DateTime createdAtDateTime = DateTime.now();
  final DateTime dueDateTime = DateTime.now();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une tâche'),
        leading: CustomIconButton(
          icon: Icons.close,
          onPressed: () {
            context.pop();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField(
                        items:
                            TaskTag.values.map((e) {
                              String name = Helpers.formatStatus(e.name);
                              return DropdownMenuItem(
                                value: e.name,
                                child: Text(name),
                              );
                            }).toList(),
                        // value: TaskTag.values[0].name,
                        onChanged: (value) {
                          tagController.text = value.toString();
                        },
                        decoration: InputDecoration(labelText: 'Tag'),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Couleur tâche',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(fontSize: 10),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              colorPickerDialog();
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: dialogPickerColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

                CustomStepper(subTask: subTask),
                const SizedBox(height: TSizes.spaceBtwSections),
                const SizedBox(height: TSizes.spaceBtwSections),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),

          Positioned(
            bottom: TSizes.spaceBtwSections - 4,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            child: CustomElevatedButton(
              title: 'Ajouter la tâche',
              onPressed: () {
                FakeData.tasks.add(
                  Task(
                    id: '${FakeData.tasks.length + 1}',
                    title: titleController.text,
                    description: descriptionController.text,
                    dueDate: dueDateTime,
                    createdAt: createdAtDateTime,
                    color: dialogPickerColor,
                    tag: tagController.text,
                    subtasks: subTask,
                  ),
                );
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) {
        setState(() {
          dialogPickerColor = color;
        });
      },
      showEditIconButton: true,
      width: 40,
      height: 40,
      borderRadius: 40,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 200,
      heading: Text(
        'Selection de couleur',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Couleur variante',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      wheelSubheading: Text(
        'Couleur personnalisée',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),

      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: true,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,

      actionsPadding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(
        minHeight: 480,
        minWidth: 300,
        maxWidth: 320,
      ),
    );
  }
}
