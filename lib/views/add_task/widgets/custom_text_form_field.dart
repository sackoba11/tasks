import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.style,
    this.enable = true,
    this.suffixIcon,
    this.prefixIcon,
  });
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final TextStyle? style;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      style: style ?? Theme.of(context).textTheme.headlineSmall,
      readOnly: keyboardType == TextInputType.datetime,
      enabled: enable,
      onTap: () {
        if (keyboardType == TextInputType.datetime) {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon ?? null,
        prefixIcon: prefixIcon ?? null,
      ),
    );
  }
}

class DateIconButton extends StatelessWidget {
  const DateIconButton({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Iconsax.calendar_2_copy),
      onPressed: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2017, 9, 7, 17, 30),
          lastDate: DateTime(2030),
          initialDate: DateTime.now(),
        );
        if (pickedDate != null) {
          controller.text =
              '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
        }
      },
    );
  }
}
