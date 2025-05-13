import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpaceAppbar),
      child: Row(
        children: [
          Text('Salue', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(width: 5),
          Text('$userName 👋', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
