import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    super.key,
    required this.title,
    required this.numberTask,
    required this.imagePath,
    this.onTap,
    this.color,
  });

  final String title;
  final int numberTask;
  final String imagePath;
  final Color? color;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(left: 8),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(height: 80, image: AssetImage(imagePath)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: TColors.black),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$numberTask Tâches',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: TColors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
