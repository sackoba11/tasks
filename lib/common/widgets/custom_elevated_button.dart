import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.loader,
  });

  final String title;
  final Widget? loader;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          loader == null
              ? null
              : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: WidgetStateProperty.all(
                  TColors.darkGrey.withOpacity(0.4),
                ),
              ),
      onPressed: loader == null ? onPressed : null,
      child:
          loader ??
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: TColors.black),
          ),
    );
  }
}
