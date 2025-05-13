import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Salue', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 5),
        Text('$userName 👋', style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
