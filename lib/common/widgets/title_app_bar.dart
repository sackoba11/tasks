import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: TSizes.spaceAppBar,
        top: TSizes.spaceAppBar,
      ),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}
