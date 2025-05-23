import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: Theme.of(context).iconButtonTheme.style,
      onPressed: onPressed,
      icon: Icon(icon, color: color),
    );
  }
}
