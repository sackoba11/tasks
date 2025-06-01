import 'package:flutter/material.dart';

class ChoiseTaskColor extends StatelessWidget {
  const ChoiseTaskColor({
    super.key,
    required this.dialogPickerColor,
    required this.onTap,
  });
  final Color dialogPickerColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Couleur tâche',
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontSize: 10),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: dialogPickerColor,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ],
    );
  }
}
