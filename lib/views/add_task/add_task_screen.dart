import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/utils/constants/enums.dart';

import '../../utils/constants/sizes.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/custom_stepper.dart';
import 'widgets/custom_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
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
                  hintText: 'Sélectionnez la date de début 👉',
                  controller: startDateController,
                  keyboardType: TextInputType.datetime,
                  suffixIcon: DateIconButton(controller: startDateController),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                CustomTextFormField(
                  labelText: 'Date de fin',
                  hintText: 'Sélectionnez la date de fin 👉',
                  controller: endDateController,
                  keyboardType: TextInputType.datetime,
                  suffixIcon: DateIconButton(controller: endDateController),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                DropdownButtonFormField(
                  items:
                      TaskTag.values.map((e) {
                        String name =
                            e.name[0].toUpperCase() +
                            e.name.substring(1).toLowerCase();
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(name),
                        );
                      }).toList(),
                  value: TaskTag.values[0].name,
                  onChanged: (value) {
                    priorityController.text = value.toString();
                    print(priorityController.text);
                  },
                  decoration: InputDecoration(labelText: 'Priorité'),
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

                // Positioned(
                //   bottom: TSizes.spaceBtwSections - 4,
                //   left: TSizes.defaultSpace,
                //   right: TSizes.defaultSpace,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       const SafeArea(child: SizedBox(height: 15)),
                //       _buildFlexibleDropdown(),
                //       const SafeArea(child: SizedBox(height: 15)),
                //     ],
                //   ),
                // ),
                CustomStepper(),
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
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildTextBtn(String title) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(6),
  //       color: Colors.blueAccent.withOpacity(.2),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //       child: Text(
  //         title,
  //         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildFlexibleDropdown() {
  //   return FlexibleDropdown(
  //     overlayChild: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  //       child: CustomStepper(),
  //     ),
  //     barrierColor: Colors.transparent,
  //     barrierShape: BarrierShape.headerTrans,
  //     textDirection: TextDirection.ltr,
  //     // duration: const Duration(milliseconds: 400),
  //     animationType: AnimationType.size,
  //     animationAlignment: Alignment.center,
  //     child: _buildTextBtn('Flexible Dropdown'),
  //   );
  // }
}
