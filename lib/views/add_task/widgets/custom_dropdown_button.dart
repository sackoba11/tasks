import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../../utils/constants/enums.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({super.key, required this.tagController});
  final TextEditingController tagController;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items:
          TaskTag.values.map((e) {
            String name = Helpers.formatStatus(e.name);
            return DropdownMenuItem(value: e.name, child: Text(name));
          }).toList(),
      // value: TaskTag.values[0].name,
      onChanged: (value) {
        tagController.text = value.toString();
      },
      decoration: InputDecoration(labelText: 'Tag'),
    );
  }
}
