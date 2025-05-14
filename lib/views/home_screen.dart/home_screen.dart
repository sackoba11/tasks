import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/body_home_screen.dart';
import 'widgets/custom_icon_button.dart';
import 'widgets/header_home_screen.dart';
import 'widgets/title_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var indexPage = 0;
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
            ),
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
                children: [
                  const HeaderHomeScreen(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Expanded(child: const BodyHomeScreen()),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: TColors.primaryColor,
        onPressed: () {},
        child: const Icon(Iconsax.add_copy, size: 28, color: TColors.black),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 80,
        icons: [
          indexPage == 0 ? Iconsax.home_1 : Iconsax.home_2_copy,
          indexPage == 1 ? Iconsax.calendar : Iconsax.calendar_1_copy,
          indexPage == 2 ? Iconsax.check : Iconsax.check_copy,
          indexPage == 3 ? Iconsax.user : Iconsax.user_copy,
        ],
        notchMargin: 10,
        activeIndex: indexPage,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: Theme.of(context).cardColor,
        activeColor: TColors.primaryColor,
        shadow: BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 20,
          spreadRadius: 0.5,
          color: TColors.black.withOpacity(0.8),
        ),
        onTap: (index) {
          setState(() {
            indexPage = index;
          });
        },
      ),
    );
  }
}
