import 'package:flutter/material.dart';

class Helpers {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String calculateSubtasksPercentage(List<dynamic> subtasks) {
    if (subtasks.isEmpty) return '';
    final doneCount = subtasks.where((s) => s.isDone == true).length;
    return ((doneCount / subtasks.length) * 100).toStringAsFixed(1);
  }
}
