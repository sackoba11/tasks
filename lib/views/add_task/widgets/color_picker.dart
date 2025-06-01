import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class CustomColorPicker {
  static Future<bool> colorPickerDialog({
    required BuildContext context,
    required Color color,
    required void Function(Color) onColorChanged,
  }) async {
    return ColorPicker(
      color: color,
      onColorChanged: onColorChanged,
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
