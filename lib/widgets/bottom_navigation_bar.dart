import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../utils/constants/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      indexPage == 0 ? Iconsax.home_1 : Iconsax.home_2_copy,
      indexPage == 1 ? Iconsax.calendar : Iconsax.calendar_1_copy,
      indexPage == 2 ? Iconsax.check : Iconsax.check_copy,
      indexPage == 3 ? Iconsax.user : Iconsax.user_copy,
    ];
    return AnimatedBottomNavigationBar(
      height: 80,
      icons: icons,
      notchMargin: 10,
      activeIndex: indexPage,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 40,
      rightCornerRadius: 40,
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
    );
  }
}
