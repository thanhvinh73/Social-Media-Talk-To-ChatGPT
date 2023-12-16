import 'package:easy_localization/easy_localization.dart';

extension DateTimeExt on DateTime {
  String get toLastMessageTime {
    final nowDate = DateTime.now();
    final differenceDuration = nowDate.difference(this);
    if (differenceDuration.inDays <= 0) {
      return DateFormat("HH:mm").format(this);
    } else if (differenceDuration.inDays > 0) {
      return DateFormat("dd/MM").format(this);
    }
    return "";
  }

  String get toDayMonthYear => DateFormat("dd/MM/yyyy").format(this);
  String get toDayMonthYearTime => DateFormat("dd/MM/yyyy HH:mm").format(this);
  String get toHourMinute => DateFormat("HH:mm").format(this);
}
