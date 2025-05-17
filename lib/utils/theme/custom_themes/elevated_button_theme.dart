import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  // Light theme elevatedButtonTheme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: TColors.primaryColor,
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: TColors.primaryColor.withOpacity(0.6), width: 1),
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
      textStyle: const TextStyle(
        fontSize: 16.0,
        color: TColors.black,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );

  // Dark theme ElevatedButtonTheme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: TColors.primaryColor.withOpacity(0.6),
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: TColors.primaryColor.withOpacity(0.6), width: 1),
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
      textStyle: const TextStyle(
        fontSize: 16.0,
        color: TColors.black,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );
}
