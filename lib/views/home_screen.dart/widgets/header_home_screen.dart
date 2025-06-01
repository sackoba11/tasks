import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/routes.dart';
import '../../../utils/constants/sizes.dart';
import 'custom_card_1.dart';
import 'custom_card_2.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            'Gérer vos tâches quotidiennes',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
        SizedBox(
          height: 208,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: CustomCard1(
                  imagePath: TImages.darkAppLogo,
                  title: 'En attente',
                  color: TColors.cardTaskColor,
                  onTap: () {
                    context.go(Routes.taskPending);
                  },
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    CustomCard2(
                      imagePath: TImages.darkAppLogo,
                      title: 'Annulées',
                      numberTask: 1,
                      color: TColors.cardTask2Color,
                      onTap: () {
                        context.go(Routes.taskCanceled);
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    CustomCard2(
                      imagePath: TImages.darkAppLogo,
                      title: 'En Retard',
                      numberTask: 2,
                      color: TColors.cardTask3Color,
                      onTap: () {
                        context.go(Routes.taskOverdue);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
