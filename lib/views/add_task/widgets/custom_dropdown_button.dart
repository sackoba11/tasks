import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/formatters/formatter.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.tagController,
    this.validator,
  });
  final TextEditingController tagController;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items:
          TaskTag.values.map((e) {
            String name = Formatter.formatStatus(e.name);
            return DropdownMenuItem(value: e.name, child: Text(name));
          }).toList(),
      // value: TaskTag.values[0].name,
      onChanged: (value) {
        tagController.text = value.toString();
      },
      decoration: InputDecoration(labelText: 'Tag'),
      validator: validator,
    );
  }
}
