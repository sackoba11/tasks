import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key, required this.children, required this.height});

  final List<Widget> children;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: SizedBox(
        height: height * 0.34,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
