import 'package:flutter/material.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
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
        margin: EdgeInsets.only(right: 8),
        color: color,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(width: 80, image: AssetImage(imagePath)),
              Center(
                child: ListTile(
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    '$numberTask Tâches',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
