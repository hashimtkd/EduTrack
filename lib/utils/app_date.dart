import 'package:intl/intl.dart';

class AppDate {
  static String todayDate() {
    final now = DateTime.now();
    return DateFormat('dd-MM-yyyy / EEEE').format(now);
  }
}
