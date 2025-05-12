import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../utils/constants/sizes.dart';
import 'widgets/body_home_screen.dart';
import 'widgets/custom_icon_button.dart';
import 'widgets/header_home_screen.dart';
import 'widgets/title_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: TitleAppBar(userName: 'Sacko'),
        actions: [
          CustomIconButton(icon: Iconsax.notification_copy, onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: TSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderHomeScreen(),
            SizedBox(height: TSizes.spaceBtwSections),
            BodyHomeScreen(),
          ],
        ),
      ),
    );
  }
}
