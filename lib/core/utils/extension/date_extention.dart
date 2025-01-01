import '../../core.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString() {
    return DateFormat('MMMM dd, yyyy').format(this);
  }

  String currentDay() {
    return DateFormat('EEEE').format(this).toLowerCase();
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
