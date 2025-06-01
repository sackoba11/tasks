import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomPopups {
  static hideSnackBar({required BuildContext context}) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast({required message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: TColors.success.withOpacity(0.9),
            // Helpers.isDarkMode(context)
            //     ? TColors.darkerGrey.withOpacity(0.9)
            //     : TColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(message, style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ),
    );
  }

  static void showAlert({
    required BuildContext context,
    required String title,
    required String message,
    String? actionText1,
    String? actionText2,
    void Function()? onPressed1,
    void Function()? onPressed2,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            if (actionText2 != null)
              TextButton(
                onPressed: onPressed2,
                child: Text(
                  actionText2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            if (actionText1 != null)
              TextButton(
                onPressed: onPressed1,
                child: Text(
                  actionText1,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: TColors.levelHighdColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  // static successSnackBar({
  //   required BuildContext context,required
  //   title,
  //   message = '',
  //   duration = 3,
  // }) {
  //   context.showSnackbar(
  //     title,
  //     message,
  //     isDismissible: true,
  //     shouldIconPulse: true,
  //     colorText: Colors.white,
  //     backgroundColor: TColors.primary,
  //     snackPosition: SnackPosition.BOTTOM,
  //     duration: Duration(seconds: duration),
  //     margin: const EdgeInsets.all(10),
  //     icon: const Icon(Iconsax.check, color: TColors.white),
  //   );
  // }

  // static warningSnackBar({required title, message = ''}) {
  //   Get.snackbar(
  //     title,
  //     message,
  //     isDismissible: true,
  //     shouldIconPulse: true,
  //     colorText: TColors.white,
  //     backgroundColor: Colors.orange,
  //     snackPosition: SnackPosition.BOTTOM,
  //     duration: const Duration(seconds: 3),
  //     margin: const EdgeInsets.all(20),
  //     icon: const Icon(Iconsax.warning_2, color: TColors.white),
  //   );
  // }

  // static errorSnackBar({required title, message = ''}) {
  //   Get.snackbar(
  //     title,
  //     message,
  //     isDismissible: true,
  //     shouldIconPulse: true,
  //     colorText: TColors.white,
  //     backgroundColor: Colors.red.shade600,
  //     snackPosition: SnackPosition.BOTTOM,
  //     duration: const Duration(seconds: 3),
  //     margin: const EdgeInsets.all(20),
  //     icon: const Icon(Iconsax.warning_2, color: TColors.white),
  //   );
  // }
}
