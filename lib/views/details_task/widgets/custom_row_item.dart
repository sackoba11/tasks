import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomRowItem extends StatelessWidget {
  const CustomRowItem({
    super.key,
    required this.title,
    required this.value,
    this.color,
  });

  final String title;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(4),
            width: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Expanded(
              child: Text(
                value,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: TColors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
