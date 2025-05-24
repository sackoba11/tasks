import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.style,
    this.enable = true,
    this.suffixIcon,
    this.prefixIcon,
  });
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
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
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

