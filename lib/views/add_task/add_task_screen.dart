import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/utils/constants/enums.dart';

import '../../utils/constants/sizes.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/custom_stepper.dart';
import '../../widgets/custom_text_form_field.dart';

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

                Positioned(
                  bottom: TSizes.spaceBtwSections - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SafeArea(child: SizedBox(height: 15)),
                      Container(
                        height: 40,
                        width: 40,
                        color: dialogPickerColor,
                      ),
                      const SafeArea(child: SizedBox(height: 15)),
                    ],
                  ),
                ),
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
                colorPickerDialog();
                // context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);
  final Map<ColorSwatch<Object>, String>
  colorsNameMap = <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };
  Color dialogPickerColor = Colors.red;
  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) {
        setState(() {
          dialogPickerColor = color;
        });
      },
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: true,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: true,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      // customColorSwatchesAndNames: colorsNameMap,
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
