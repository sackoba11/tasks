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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.accent,
        onPressed: () {},
        child: const Icon(Iconsax.add_circle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_2_copy),
            activeIcon: Icon(Iconsax.home_1),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(Iconsax.calendar_1_copy),
            activeIcon: Icon(Iconsax.calendar),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.check_copy),
            activeIcon: Icon(Iconsax.check),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user_copy),
            activeIcon: Icon(Iconsax.user),
            label: '',
          ),
        ],
        currentIndex: indexPage,
        selectedItemColor: TColors.accent.withOpacity(0.8),
        unselectedItemColor: Theme.of(context).colorScheme.onBackground,
        onTap: (index) {
          setState(() {
            indexPage = index;
          });
        },
      ),
    );
  }
}
