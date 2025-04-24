String? formatDateFunction(DateTime? date) {
  if (date == null) return null;
  {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}

String formatDateYMD(String isoDate) {
  final dateTime = DateTime.parse(isoDate);
  final year = dateTime.year.toString().padLeft(4, '0');
  final month = dateTime.month.toString().padLeft(2, '0');
  final day = dateTime.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

/// Parses an ISO‑8601 datetime string and returns a Map with year, month, and day.
Map<String, int> splitDateYMD(String isoDate) {
  final dateTime = DateTime.parse(isoDate);
  return {
    'year': dateTime.year,
    'month': dateTime.month,
    'day': dateTime.day,
  };
}
