import 'package:intl/intl.dart';

extension DateTimeStringX on String {
  /// Formats a date string from ISO 8601 format (2024-03-15T08:00:00Z)
  /// to custom format (2024.08.15)
  String formatDate() {
    try {
      final DateTime dateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('yyyy.MM.dd');
      return formatter.format(dateTime);
    } catch (e) {
      return '-'; // Return a fallback value if parsing fails
    }
  }

  /// Formats a date string from ISO 8601 format (2024-03-15T08:00:00Z)
  /// to custom format (2024.08.15)
  String formatMonthAndDate() {
    try {
      final DateTime dateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('MM/yy');
      return formatter.format(dateTime);
    } catch (e) {
      return '-'; // Return a fallback value if parsing fails
    }
  }

  /// Formats a date string from ISO 8601 format (2024-03-15T08:00:00Z)
  /// to custom format (2024.08.15)
  String formatTime() {
    try {
      final DateTime dateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('HH:mm');
      return formatter.format(dateTime);
    } catch (e) {
      return '-'; // Return a fallback value if parsing fails
    }
  }

  DateTime? toDateTime() {
    try {
      return DateTime.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// Calculates the difference in years between this date string and current date
  /// Returns only the number of years as an integer
  String diffInYear() {
    // If string doesn't contain '-', return the string itself
    if (!contains('-')) {
      return '${DateTime.now().year - DateTime(int.parse(this)).year}';
    }

    try {
      DateTime dateTime;

      // Try to parse ISO format first
      try {
        dateTime = DateTime.parse(this);
      } catch (_) {
        // Try to handle simple date format YYYY-MM-DD
        final parts = split('-');
        if (parts.length == 3) {
          dateTime = DateTime(
              int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
        } else {
          throw const FormatException('Invalid date format');
        }
      }

      final DateTime now = DateTime.now();

      // Calculate the difference in years
      int yearDiff = now.year - dateTime.year;

      // Adjust for cases where we haven't reached the same month/day yet in the current year
      if (now.month < dateTime.month ||
          (now.month == dateTime.month && now.day < dateTime.day)) {
        yearDiff--;
      }

      return '${yearDiff >= 0 ? yearDiff : 0}';
    } catch (e) {
      return '-';
    }
  }
}

extension DateTimeX on DateTime? {
  /// Formats a DateTime object to custom format (2024/08/15)
  String formatDate() {
    if (this == null) return 'Invalid Date';
    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    return formatter.format(this!);
  }
}
