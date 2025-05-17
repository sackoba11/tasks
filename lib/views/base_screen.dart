import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../utils/constants/colors.dart';
import 'add_task/add_task_screen.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.navigationShell, {super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      navigationShell.currentIndex == 0 ? Iconsax.home_1 : Iconsax.home_2_copy,
      navigationShell.currentIndex == 1
          ? Iconsax.calendar
          : Iconsax.calendar_1_copy,
      Icons.done_all_sharp,
      navigationShell.currentIndex == 3 ? Iconsax.user : Iconsax.user_copy,
    ];

    return Scaffold(
      body: navigationShell,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: TColors.primaryColor,
        onPressed: () {
          showCupertinoModalBottomSheet(
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) => const AddTaskScreen(),
          );
        },
        child: const Icon(Iconsax.add_copy, size: 28, color: TColors.black),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 80,
        icons: icons,
        notchMargin: 10,
        activeIndex: navigationShell.currentIndex,
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
        onTap: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
