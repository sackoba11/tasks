import '../constants/text_strings.dart';

class Formatter {
  static String formatStatus(String status) {
    return status
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}')
        .replaceFirstMapped(
          RegExp(r'^\w'),
          (match) => match.group(0)!.toUpperCase(),
        )
        .trim();
  }

  static String formatDate(DateTime date) {
    return '${TTexts.days[date.weekday - 1]}, ${date.day.toString().padLeft(2, '0')} '
        '${TTexts.month[date.month - 1]} '
        '${date.year}';
  }

  static String formatDateOnAddTask(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  static String formatCardDate(DateTime date) {
    return ' ${date.day.toString().padLeft(2, '0')} '
        '${TTexts.month[date.month - 1]} ';
    // '${date.year}';
  }

  static String formatHour(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
