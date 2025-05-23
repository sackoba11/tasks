class Helpers {
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
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
