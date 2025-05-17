import 'package:flutter/material.dart';
import 'package:tasks/utils/constants/enums.dart';
import 'package:universal_stepper/universal_stepper.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
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
    bool isAddStep = false;
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
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                CustomTextFormField(
                  labelText: 'Date de fin',
                  hintText: 'Sélectionnez la date de fin 👉',
                  controller: endDateController,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                DropdownButtonFormField(
                  items:
                      TaskLevel.values.map((e) {
                        String name =
                            e.name[0].toUpperCase() +
                            e.name.substring(1).toLowerCase();
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(name),
                        );
                      }).toList(),
                  value: TaskLevel.values[0].name,
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
                CustomStepper(),
                const SizedBox(height: TSizes.spaceBtwSections),
                const SizedBox(height: TSizes.spaceBtwSections),
                const SizedBox(height: TSizes.spaceBtwSections),
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
              child: CustomElevatedButton(
                title: 'Ajouter la tâche',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: TColors.black),
      ),
    );
  }
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Step> stepperData = [
    // Step(
    //   title: Text("Order Placed"),
    //   subtitle: Text("Your order has been placed"),
    //   content: Text("Your order has been placed"),
    // ),
    // const Step(
    //   title: Text("Preparing"),
    //   subtitle: Text("Your order is being prepared"),
    //   content: Text("Your order is being prepared"),
    // ),
    // const Step(
    //   title: Text("On the way"),
    //   subtitle: Text('data'),
    //   content: Text('data'),
    // ),
    // const Step(
    //   title: Text("Delivered"),
    //   subtitle: Text("Your order was delivered successfully"),
    //   content: Text("Your order was delivered successfully"),
    // ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: TSizes.spaceBtwItems),
          Text('Ajout des étapes'),
          const SizedBox(height: TSizes.spaceBtwItems),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFormField(
                labelText: 'Titre',
                hintText: 'Donner le titre',
                controller: titleController,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              CustomTextFormField(
                labelText: 'Details',
                hintText: 'Donner les details',
                controller: descriptionController,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    setState(() {
                      stepperData.add(
                        Step(
                          title: Text(
                            titleController.text,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          content: Text(
                            descriptionController.text,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      );
                      titleController.text = '';
                      descriptionController.text = '';
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Ajouter',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: TColors.black),
                  ),
                ),
              ),
            ],
          ),

          UniversalStepper(
            stepperDirection: Axis.vertical,
            elementBuilder: (context, index) {
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          stepperData[index].title,
                          stepperData[index].content,
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          stepperData.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              );
            },
            badgeBuilder: (context, index) {
              return Container(
                width: 30,
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: FittedBox(
                  child: Icon(
                    Icons.check_circle_outline_sharp,
                    color: TColors.white,
                  ),
                ),
              );
            },
            pathBuilder: (context, index) {
              return Container(
                color:
                    index == stepperData.length
                        ? Colors.transparent
                        : index == 0
                        ? Colors.transparent
                        : Colors.green,
                width: 4,
              );
            },
            subPathBuilder: (context, index) {
              return Container(
                color:
                    index == stepperData.length - 1
                        ? Colors.transparent
                        : Colors.green,
                width: 4,
              );
            },
            elementCount: stepperData.length,
          ),
        ],
      ),
    );
  }
}
