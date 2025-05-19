import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:universal_stepper/universal_stepper.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Step> stepperData = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: TSizes.spaceBtwItems),
          Text('Ajout des étapes (Facultatif)'),
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
              CustomElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    setState(() {
                      stepperData.add(
                        Step(
                          title: Text(
                            titleController.text,
                            style: Theme.of(context).textTheme.labelLarge,
                            overflow: TextOverflow.clip,
                          ),
                          content: SizedBox(
                            width: size.width * .64,
                            child: Text(
                              descriptionController.text,
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      );
                      titleController.text = '';
                      descriptionController.text = '';
                    });
                  }
                },
                title: 'Ajouter',
              ),
            ],
          ),
          UniversalStepper(
            elementCount: stepperData.length,
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
                      icon: Icon(Iconsax.close_circle_copy, size: 32),
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
                  color: TColors.success,
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
                        : TColors.success,
                width: 4,
              );
            },
            subPathBuilder: (context, index) {
              return Container(
                color:
                    index == stepperData.length - 1
                        ? Colors.transparent
                        : TColors.success,
                width: 4,
              );
            },
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
