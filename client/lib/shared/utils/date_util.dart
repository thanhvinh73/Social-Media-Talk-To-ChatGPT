import 'package:easy_localization/easy_localization.dart';

class DateTimeUtils {
  static String convertToString(String format, int milliseconds) {
    return DateFormat(format)
        .format(DateTime.fromMillisecondsSinceEpoch(milliseconds));
  }

  static int convertToMilliseconds(String format, String datetime) {
    DateTime date = DateFormat(format).parse(datetime);
    if (date.hour == 0 && date.minute == 0 && date.second == 0) {
      date = date.copyWith(hour: 7, minute: 0, second: 0);
    }
    return date.millisecondsSinceEpoch;
  }
}
