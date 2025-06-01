import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(image),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        ),
      ],
    );
  }
}
