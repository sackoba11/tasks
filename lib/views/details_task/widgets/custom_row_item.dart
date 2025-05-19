import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomRowItem extends StatelessWidget {
  const CustomRowItem({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: Colors.black.withOpacity(0.5)),
        ),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: TColors.black),
        ),
      ],
    );
  }
}
