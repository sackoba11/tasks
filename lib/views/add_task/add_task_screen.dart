import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/utils/popups/popups.dart';

import '../../common/widgets/custom_icon_button.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../data/fake_data/fake_data.dart';
import '../../models/sub_task.dart';
import '../../models/task.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/validators/validation.dart';
import 'widgets/button_add_task.dart';
import 'widgets/choise_task_color.dart';
import 'widgets/color_picker.dart';
import 'widgets/custom_dropdown_button.dart';
import 'widgets/custom_form.dart';
import 'widgets/custom_stepper.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
  Color dialogPickerColor = Colors.blue;
  final List<SubTask> subTask = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController createdAtController = TextEditingController();
  final TextEditingController createdAtDateTime = TextEditingController();
  final TextEditingController dueDateTime = TextEditingController();
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: TSizes.spaceBtwItems),
                  BaseForm(
                    titleController: titleController,
                    createdAtController: createdAtController,
                    createdAtDateTime: createdAtDateTime,
                    dueDateController: dueDateController,
                    dueDateTime: dueDateTime,
                    descriptionController: descriptionController,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomDropDownButton(
                          tagController: tagController,
                          validator:
                              (value) => Validator.validateEmptyValue(value),
                        ),
                      ),
                      SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        flex: 2,
                        child: ChoiseTaskColor(
                          dialogPickerColor: dialogPickerColor,
                          onTap: () async {
                            await CustomColorPicker.colorPickerDialog(
                              context: context,
                              color: dialogPickerColor,
                              onColorChanged: (Color color) {
                                setState(() {
                                  dialogPickerColor = color;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomStepper(subTask: subTask),
                  const SizedBox(height: TSizes.spaceBtwSections * 3),
                ],
              ),
            ),
          ),
          ButtonAddTask(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                if (int.parse(createdAtDateTime.text) >
                    int.parse(dueDateTime.text)) {
                  CustomPopups.showAlert(
                    context: context,
                    title: 'Erreur Date',
                    message:
                        'La date de début ne peut être supérieure à la date de fin',
                  );
                } else {
                  var task = Task(
                    id: '${FakeData.tasks.length + 1}',
                    title: titleController.text,
                    description: descriptionController.text,
                    dueDate: DateTime.fromMillisecondsSinceEpoch(
                      int.parse(dueDateTime.text),
                    ),
                    createdAt: DateTime.fromMillisecondsSinceEpoch(
                      int.parse(createdAtDateTime.text),
                    ),
                    color: dialogPickerColor,
                    tag: tagController.text,
                    subtasks: subTask,
                  );
                  await context.read<TaskCubit>().addTasks(task: task);
                  CustomPopups.customToast(
                    message: 'Tâche ajoutée avec succès',
                    // ignore: use_build_context_synchronously
                    context: context,
                  );
                  context.pop();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
