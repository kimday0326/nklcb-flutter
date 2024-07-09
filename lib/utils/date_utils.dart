import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDate(DateTime date, {bool includeTime = false}) {
    if (includeTime) {
      return DateFormat('yyyy-MM-dd HH:mm').format(date); // 년월일 시분 형식
    } else {
      return DateFormat('yyyy-MM-dd').format(date); // 년월일 형식
    }
  }
}
