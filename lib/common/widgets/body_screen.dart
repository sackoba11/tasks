import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';


class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(children: children),
    );
  }
}
