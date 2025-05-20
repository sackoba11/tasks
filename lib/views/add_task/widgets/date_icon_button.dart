import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// ignore: must_be_immutable
class DateIconButton extends StatelessWidget {
  DateIconButton({
    super.key,
    required this.controller,
    this.dateTimeController,
  });

  final TextEditingController controller;
  DateTime? dateTimeController;

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
          dateTimeController = pickedDate;
        }
      },
    );
  }
}
