import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({
    super.key,
    required this.height,
    required this.children,
  });

  final double height;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.5478,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
